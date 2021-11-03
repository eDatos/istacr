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
