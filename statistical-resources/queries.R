source('utils/services.R')

API = 'statistical-resources'

get_statisticalresources_datasets <- function(lang='es', limit=25, offset=0, orderby='', query='') {
  path = 'datasets'
  url = build_entrypoint_url(
    API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

get_statisticalresources_queries_agency <- function(agencyid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('queries/', agencyid)
  url = build_entrypoint_url(API, path, list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query))
  get_content(url)
}

get_statisticalresources_queries_agency_resource <- function(agencyid,  resourceid, fields='', lang='es', as_dataframe=FALSE) {
  path = paste0('queries/', agencyid, '/', resourceid)
  url = build_entrypoint_url(API, path, list(fields=fields, lang=lang))
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_api_response(api_response))
  } else {
    return(api_response)
  }
}
