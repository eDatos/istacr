API = 'structural-resources'

get_structuralresources_categorisations <- function(limit=25, offset=0, query='', orderby='') {
  path = 'categorisations'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_categorisations_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('categorisations', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_categorisations_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('categorisations', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_categorisations_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('categorisations', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_category_schemes <- function(limit=25, offset=0, query='', orderby='') {
  path = 'categoryschemes'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_category_schemes_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
path = paste('categoryschemes', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_category_schemes_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('categoryschemes', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_category_schemes_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('categoryschemes', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_category_schemes_agency_resource_version_categories <- function(agencyid, resourceid, version, limit=25, offset=0, query='', orderby='') {
  path = paste('categoryschemes', agencyid, resourceid, version, 'categories', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_category_schemes_agency_resource_version_categories_id <- function(agencyid, resourceid, version, categoryid) {
  path = paste('categoryschemes', agencyid, resourceid, version, 'categories', categoryid, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}
