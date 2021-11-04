#source('utils/config.R')

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
  result
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
    dimension_id = dimension['id']
    dimension_values = dimension$dimensionValues$value[[1]]
    codelist = list()
    for(dimension_value_index in 1:nrow(dimension_values)) {
      dimension_value = dimension_values[dimension_value_index,]
      value_id = dimension_value$id
      value_text = dimension_value$name$text[[1]]$value
      append(codelist, value_id = value_text)
    }
    codelists[dimension_id] = codelist
  }
  codelists
}

convert_api_response_to_dataframe <- function(api_response) {
  dimensions = api_response['data']['dimensions']['dimension']
  observations = api_response['data']['observations']
  observations = re.split(r'\s*\|\s*', observations)

  dimension_codes = []
  dimension_titles = []

  for(dimension in dimensions) {
    dimension_titles.append(dimension['dimensionId'])
    representations = dimension['representations']['representation']
    codes = [r['code'] for r in sorted(representations, key=lambda c: c['index'])]
    dimension_codes.append(codes)
  }

  dimension_codes_product = itertools.product(*dimension_codes)
  data = [dim + (obs,) for dim, obs in zip(dimension_codes_product, observations)]
  columns = dimension_titles + ['OBSERVACIONES']

  return pd.DataFrame(data, columns=columns)

}

build_resolved_api_response <- function(api_response) {
  return(
    {
      dataframe = convert_api_response_to_dataframe(api_response),
      codelists = get_codelists_from_api_response(api_response)
    }
  )
}
