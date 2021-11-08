API = 'indicators'

get_indicators_systems <- function(limit=25, offset=0) {
  path = 'indicatorsSystems'
  url = build_entrypoint_url(API, path, query_list = list(limit=limit, offset=offset))
  get_content(url)
}

get_indicators_systems_code <- function(indicatorsystemcode) {
  path = paste('indicatorsSystems', indicatorsystemcode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_indicators_systems_code_instances <- function(indicatorsystemcode, q='', order='', limit=25, offset=0, fields='', representation='', granularity='') {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(q=q, order=order, limit=limit, offset=offset, fields=fields, representation=representation, granularity=granularity)
  )
  get_content(url)
}

get_indicators_systems_code_instances_code <- function(indicatorsystemcode, indicatorinstancecode) {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances',indicatorinstancecode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_indicators_systems_code_instances_code_data <- function(indicatorsystemcode, indicatorinstancecode, representation='', granularity='', fields='') {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances', indicatorinstancecode, 'data', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(representation=representation, granularity=granularity, fields=fields)
  )
  get_content(url)
}

