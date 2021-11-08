API = 'statistical-resources'

get_statisticalresources_datasets <- function(lang='es', limit=25, offset=0, orderby='', query='') {
  path = 'datasets'
  url = build_entrypoint_url(
    API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

get_statisticalresources_datasets_agency <- function(agencyid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('/datasets/', agencyid)
  url = build_entrypoint_url(
    API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

get_statisticalresources_datasets_agency_resource <- function(agencyid, resourceid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('/datasets/', agencyid, '/', resourceid)
  url = build_entrypoint_url(
    API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

get_statisticalresources_datasets_agency_resource_version <- function(agencyid, resourceid, version, dim='', fields='', lang='es', as_dataframe=F) {
  path = paste('datasets', agencyid, resourceid, version, sep = "/")
  url = build_entrypoint_url(API, path, query_list = list(dim=dim, fields=fields, lang=lang))
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_api_response(api_response))
  } else {
    return(api_response)
  }
}
