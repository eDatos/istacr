#source('R/services.R')

STRUCTURAL_RESOURCES_API = 'structural-resources'

#' @title Get concept types
#' @description This function returns the content from ``/v1.0/conceptTypes``
#' @examples
#' get_structuralresources_concept_types()
#' @export
get_structuralresources_concept_types <- function() {
  path = 'conceptTypes'
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}


#' @title Get concept schemes
#' @description This function returns the content from ``/v1.0/conceptschemes``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes()
#' get_structuralresources_concept_schemes(
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_concept_schemes <- function(limit=25, offset=0, query='', orderby='') {
  path = 'conceptschemes'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get concept schemes agency
#' @description This function returns the content from ``/v1.0/conceptschemes/{agencyID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes_agency("ISTAC")
#' get_structuralresources_concept_schemes_agency(
#' "ESTAT",
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_concept_schemes_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('conceptschemes', agencyid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get concept schemes agency resource
#' @description This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource(
#' agencyid="ISTAC",
#' resourceid="CSM_C00010A_SIE"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('conceptschemes', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get concept schemes agency resource version
#' @description This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}``
#' @param agencyid (string) Identifier of the agency that publishes.
#' @param resourceid (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version(
#' agencyid="ISTAC",
#' resourceid="CSM_C00010A_SIE",
#' version="01.000"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('conceptschemes', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get concept schemes agency resource version concepts
#' @description This function returns the content from
#' ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @param fields (string): Additional fields that you want to show in the answer.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version_concepts(
#' agencyid="ISTAC",
#' resourceid="CSM_C00010A_SIE",
#' version="01.000"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version_concepts <- function(agencyid, resourceid, version, limit=25, offset=0, query='', orderby='', fields='') {
  path = paste('conceptschemes', agencyid, resourceid, version, 'concepts', sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby, fields=fields)
  )
  get_content(url)
}

#' @title Get concept schemes agency resource version concepts (id)
#' @description This function returns the content from
#' ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts/{conceptID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @param conceptid (string): Concept identifier.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version_concepts_id(
#' agencyid="ISTAC",
#' resourceid="CSM_C00010A_SIE",
#' version="01.000",
#' conceptid="ELECTORES"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version_concepts_id <- function(agencyid, resourceid, version, conceptid) {
path = paste('conceptschemes', agencyid, resourceid, version, 'concepts', conceptid, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}
