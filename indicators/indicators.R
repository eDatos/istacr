API = 'indicators'

get_indicators <- function(q='', order='', limit=25, offset=0, fields='', representation='') {
  path = 'indicators'
  url = build_entrypoint_url(
    API,path, query_list = list(q=q, order=order, limit=limit, offset=offset, fields=fields, representation=representation)
  )
  get_content(url)
}

get_indicators_code <- function(indicatorcode) {
  path = paste('indicators', indicatorcode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_indicators_code_data <- function(indicatorcode, representation='', granularity='', fields='', as_dataframe=F) {
  path = paste('indicators', indicatorcode, 'data', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(representation=representation, granularity=granularity, fields=fields)
  )
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_indicators_api_response(api_response))
  } else {
    return(api_response)
  }
}
