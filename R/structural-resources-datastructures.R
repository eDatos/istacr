#source('R/services.R')

STRUCTURAL_RESOURCES_API = 'structural-resources'

#' @title Get content constraints
#' @description This function returns the content from ``/v1.0/contentConstraints``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints()
#' get_structuralresources_content_constraints(
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_content_constraints <- function(limit=25, offset=0, query='', orderby='') {
  path = 'contentConstraints'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get content constraints agency
#' @description This function returns the content from ``/v1.0/contentConstraints/{agencyID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints_agency("ISTAC")
#' @export
get_structuralresources_content_constraints_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('contentConstraints', agencyid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get content constraints agency resource
#' @description This function returns the content from ``/v1.0/contentConstraints/{agencyID}/{resourceID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints_agency_resource(
#' "ISTAC",
#' "CSM_C00010A_SIE"
#' )
#' @export
get_structuralresources_content_constraints_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('contentConstraints', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get content constraints agency resource version
#' @description This function returns the content from ``/v1.0/contentConstraints/{agencyID}/{resourceID}/{version}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @examples
#' get_structuralresources_content_constraints_agency_resource_version(
#' "ISTAC",
#' "CSM_C00010A_SIE",
#' "01.000"
#' )
#' @export
get_structuralresources_content_constraints_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('contentConstraints', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get content constraints agency resource version regions
#' @description This function returns the content from
#' ``/v1.0/contentConstraints/{agencyID}/{resourceID}/{version}/regions/``{regionCode}
#' @param regioncode (string) Region code.
#' @param agencyid (string) Identifier of the agency that publishes.
#' @param resourceid (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_content_constraints_agency_resource_version_regions(
#' "0001",
#' "ISTAC",
#' "CSM_C00010A_SIE",
#' "01.000"
#' )
#' @export
get_structuralresources_content_constraints_agency_resource_version_regions <- function(regioncode, agencyid, resourceid, version) {
  path = paste('contentConstraints', agencyid, resourceid, version, 'regions', regioncode, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get data structures
#' @description This function returns the content from ``/v1.0/datastructures``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures()
#' get_structuralresources_data_structures(
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_data_structures <- function(limit=25, offset=0, query='', orderby='') {
  path = 'datastructures'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get data structures agency
#' @description This function returns the content from ``/v1.0/datastructures/{agencyID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures_agency("ISTAC")
#' @export
get_structuralresources_data_structures_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('datastructures', agencyid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get data structures agency resource
#' @description This function returns the content from ``/v1.0/datastructures/{agencyID}/{resourceID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures_agency_resource(
#' "ISTAC",
#' "DSD_C00010A_00001"
#' )
#' @export
get_structuralresources_data_structures_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('datastructures', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get data structures agency resource version
#' @description This function returns the content from
#' ``/v1.0/datastructures/{agencyID}/{resourceID}/{version}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @examples
#' get_structuralresources_data_structures_agency_resource_version(
#' "ISTAC",
#' "DSD_C00010A_00001",
#' "01.001"
#' )
#' @export
get_structuralresources_data_structures_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('datastructures', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

