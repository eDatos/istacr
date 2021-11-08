API = 'structural-resources'

get_structuralresources_content_constraints <- function(limit=25, offset=0, query='', orderby='') {
  path = 'contentConstraints'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_content_constraints_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('contentConstraints', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_content_constraints_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('contentConstraints', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_content_constraints_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('contentConstraints', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_content_constraints_agency_resource_version_regions <- function(regioncode, agencyid, resourceid, version) {
  path = paste('contentConstraints', agencyid, resourceid, version, 'regions', regioncode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_data_structures <- function(limit=25, offset=0, query='', orderby='') {
  path = 'datastructures'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_data_structures_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('datastructures', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_data_structures_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('datastructures', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_data_structures_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('datastructures', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

