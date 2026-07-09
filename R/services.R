require(jsonlite)
require(utils)
require(httr)

.pkg_env <- new.env(parent = emptyenv())

API_ROOT_URL = 'https://datos.canarias.es/api/estadisticas/'
API_VERSION = '1.0'
# Change the API_KEY name to avoid confusion.
# - The API_KEY content does not refer to an access token.
# - It's actually used to redirect queries.
# ISTAC_API_KEY = 'dWcm6Nn4xVO3JyAsfnGMSg5Cm2lmDQpSj73vYAzLFuswu5X1fwbuGSXnB5iLaTiT'
# IBESTAT_API_KEY = 'ycpbugocdtSCeHYqVBkueEqipWyEQlY6KiviEPfKR2uDmvExY20eZm5VREyOM9P1'
VALUE_ERROR = 'NaN'
DEBUG = FALSE

build_entrypoint_url <- function(api, path, query_list = list()) {
  #encoded_query <- URLdecode(query) TODO subs build_query
  urlpath = paste0('/', api, '/v', API_VERSION,'/', path, build_query(query_list))

  paste0(API_ROOT_URL, urlpath)
}

#' @importFrom utils URLencode
#' @importFrom utils str
build_query <- function(query_list) {
  result <- ""
  if(length(query_list) > 0) {
    element <- query_list[1]
    result <- paste0("?", names(element), '=', element[[1]])
  }
  if(length(query_list) > 1) {
    for(i in 2:length(query_list)) {
      element <- query_list[i]
      result <- paste0(result, '&', names(element), '=', element[[1]])
    }
  }
  URLencode(result)
}

# get_api_key <- function(url) {
#   api_key <- ""
#   if(grepl("canarias", url, fixed=TRUE)) {
#     api_key <- ISTAC_API_KEY
#   }
#   if(grepl("ibestat", url, fixed=TRUE)) {
#     api_key <- IBESTAT_API_KEY
#   }
#   return(api_key)
# }

get_api_key <- function(url) {

  api_key <- ""

  if (grepl("canarias", url, fixed = TRUE)) {
    api_key <- .api_keys$canarias
  }

  if (grepl("ibestat", url, fixed = TRUE)) {
    api_key <- .api_keys$ibestat
  }

  api_key

}

get_content <- function(url) {

  content <- NULL

  tryCatch(
    # Try to get content JSON from ISTAC api
    expr = {
      httpResponse <- GET(url, add_headers("api-key" = get_api_key(url)), accept_json())
      content <- fromJSON(content(httpResponse, "text"))
    },
    # Catch errors
    error = function(e){
      message('Oops! An error occurred while accessing the ISTAC api')
      #e.requested_url <- url
      content <- NULL
      print(e)
    },
    # Catch warnings
    warning = function(w){
      message('Oops! Some warnings ocurred')
      content <- NULL
      print(w)
    }
  )
  return(content)
}


get_codelists_from_api_response <- function(api_response) {
  dimensions = api_response[["metadata"]][["dimensions"]][["dimension"]]
  codelists = list()
  for (dimension_index in 1:nrow(dimensions)) {
    dimension = dimensions[dimension_index, ]
    dimension_id = dimension$id
    dimension_values = dimension$dimensionValues$value[[1]]
    codelist = data.frame()
    for(dimension_value_index in 1:nrow(dimension_values)) {
      dimension_value = dimension_values[dimension_value_index,]
      value_id = dimension_value$id
      value_text = dimension_value$name$text[[1]]$value
      codelist <- rbind(codelist, data.frame(id = value_id, value = value_text))
    }
    codelists[[dimension_id]] = codelist
  }
  codelists
}

get_codelists_from_indicators_api_response <- function(api_response) {
  dimensions = api_response$dimension
  codelists = list()
  for (dimension_index in 1:length(dimensions)) {
    dimension = dimensions[dimension_index][[1]]
    dimension_id = names(dimensions[dimension_index])
    dimension_values = names(dimension$representation$index)
    codelist = data.frame()
    codelist <- rbind(codelist, data.frame(code = dimension_values))
    codelists[[dimension_id]] = codelist
  }
  codelists
}

convert_api_response_to_dataframe <- function(api_response) {
  observations = api_response[["data"]][["observations"]]
  observations <- strsplit(observations, "\\|")[[1]]
  observations <- data.frame(OBSERVACIONES = trimws(observations))

  dimensions = api_response[["data"]][["dimensions"]][["dimension"]]
  dimension_codes = data.frame()
  for(dimension_index in 1:nrow(dimensions)) {
    dimension = dimensions[dimension_index, ]
    representation = dimension$representations$representation[[1]]
    codes <- data.frame(representation$code)
    names(codes) <- dimension$dimensionId
    if (length(dimension_codes) > 0) {
      dimension_codes <- merge(codes, dimension_codes, by= NULL)
    } else {
      dimension_codes <- data.frame(codes)
    }
  }
  dimension_codes <- dimension_codes[,ncol(dimension_codes):1]
  names(dimension_codes) <- dimensions$dimensionId

  result = data.frame(dimension_codes, observations)
  if ("attributes" %in% names(api_response[["data"]])) {
    for(attribute_index in 1:nrow(api_response[["data"]][["attributes"]][["attribute"]]["id"])) {
        result[api_response[["data"]][["attributes"]][["attribute"]][["id"]][attribute_index]] = strsplit(api_response[["data"]][["attributes"]][["attribute"]][["value"]][attribute_index], "\\|")[[1]]
    }
  }

  result
}

convert_indicators_api_response_to_dataframe <- function(api_response) {
  observations = api_response$observation
  observations <- data.frame(OBSERVACIONES = trimws(observations))

  dimensions = api_response$dimension
  dimension_codes = data.frame()
  for(dimension_index in 1:length(dimensions)) {
    dimension = dimensions[dimension_index][[1]]
    representation = dimension$representation
    codes <- data.frame(names(representation$index))
    names(codes) <- names(dimensions[dimension_index])
    if (length(dimension_codes) > 0) {
      dimension_codes <- merge(codes, dimension_codes, by= NULL)
    } else {
      dimension_codes <- data.frame(codes)
    }
  }
  dimension_codes <- dimension_codes[,ncol(dimension_codes):1]

  data.frame(dimension_codes, observations)
}

convert_codelists_api_response_to_dataframe <- function(api_response, lang) {
  codes = api_response[["code"]]
  result = data.frame()
  for(code_index in 1:nrow(codes)) {
    lang_index = which(codes[['name']][['text']][[code_index]]['lang'] == lang)
    result <- rbind(result, data.frame(id = codes[['id']][[code_index]], name = codes[['name']][['text']][[code_index]][['value']][lang_index]))
  }
  result
}

build_resolved_api_response <- function(api_response) {
  return(
    list(
      dataframe = convert_api_response_to_dataframe(api_response),
      codelists = get_codelists_from_api_response(api_response)
    )
  )
}

build_resolved_indicators_api_response <- function(api_response) {
  return(
    list(
      dataframe = convert_indicators_api_response_to_dataframe(api_response),
      codelists = get_codelists_from_indicators_api_response(api_response)
    )
  )
}

build_resolved_codelists_api_response <- function(api_response_list, lang) {
  codelist = data.frame()
  for (api_response in api_response_list) {
    codelist = rbind(codelist, convert_codelists_api_response_to_dataframe(api_response, lang))
  }
  codelist
}

change_api_url <- function(api_root_url) {
  API_ROOT_URL <<- api_root_url
  return(API_ROOT_URL)
}
