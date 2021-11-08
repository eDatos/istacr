API = 'structural-resources'

get_structuralresources_concept_types <- function() {
  path = 'conceptTypes'
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_concept_schemes <- function(limit=25, offset=0, query='', orderby='') {
  path = 'conceptschemes'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_concept_schemes_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('conceptschemes', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_concept_schemes_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('conceptschemes', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_concept_schemes_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('conceptschemes', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_concept_schemes_agency_resource_version_concepts <- function(agencyid, resourceid, version, limit=25, offset=0, query='', orderby='', fields='') {
  path = paste('conceptschemes', agencyid, resourceid, version, 'concepts', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby, fields=fields)
  )
  get_content(url)
}

get_structuralresources_concept_schemes_agency_resource_version_concepts_id <- function(agencyid, resourceid, version, conceptid) {
path = paste('conceptschemes', agencyid, resourceid, version, 'concepts', conceptid, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}
