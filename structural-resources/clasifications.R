API = 'structural-resources'

get_structuralresources_codelist_families <- function(limit=25, offset=0, orderby='', query='') {
  path = 'codelistfamilies'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

get_structuralresources_codelist_families_id <- function(id) {
  path = paste('codelistfamilies', id, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_codelists <- function(limit=25, offset=0, query='', orderby='') {
  path = 'codelists'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_codelists_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('codelists', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_codelists_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('codelists', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_codelists_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('codelists', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_codelists_agency_resource_version_codes <- function(agencyid, resourceid, version, limit=25, offset=0, query='', orderby='', openness='', order='', fields='') {
  path = paste('codelists', agencyid, resourceid, version, 'codes', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby, openness=openness, order=order, fields=fields)
  )
  get_content(url)
}

get_structuralresources_codelists_agency_resource_version_codes_codeid <- function(agencyid, resourceid, version, codeid) {
  path = paste('codelists', agencyid, resourceid, version, 'codes', codeid, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}
