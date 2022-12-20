require(jsonlite)
require(utils)

API_ROOT_URL = 'https://datos.canarias.es/api/estadisticas/'
API_VERSION = '1.0'
VALUE_ERROR = 'NaN'
DEBUG = FALSE

build_entrypoint_url <- function(api, path, query_list = list()) {
  #lang='es', limit=25, offset=0, orderby='', query=''
  #encoded_query <- URLdecode(query) TODO subs build_query
  urlpath = paste0('/', api, '/v', API_VERSION,'/', path, build_query(query_list))

  paste0(API_ROOT_URL, urlpath)
}

#' @importFrom utils URLencode
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

get_content <- function(url) {

  content <- NULL

  tryCatch(
    # TODO revisar lectura config
    #if(DEBUG) {
    #  print(url)
    #}

    # Try to get content JSON from ISTAC api
    expr = {
      content <- fromJSON(url)
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

  data.frame(dimension_codes, observations)
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
  names(dimension_codes) <- dimensions$dimensionId

  data.frame(dimension_codes, observations)
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
