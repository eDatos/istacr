#source('R/services.R')

API = 'structural-resources'

#' @title Get categorisations
#' @description This function returns the content from ``/v1.0/categorisations``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations()
#'  get_structuralresources_categorisations(
#'  query="ID EQ 2090",
#'  orderby="ID ASC"
#'  )
#' @export
get_structuralresources_categorisations <- function(limit=25, offset=0, query='', orderby='') {
  path = 'categorisations'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get categorisations agency
#' @description This function returns the content from ``/v1.0/categorisations/{agencyID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations_agency("ISTAC")
#' @export
get_structuralresources_categorisations_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('categorisations', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get categorisations agency resource
#' @description This function returns the content from ``/v1.0/categorisations/{agencyID}/{resourceID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations_agency_resource("ISTAC", "cat2")
#' @export
get_structuralresources_categorisations_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('categorisations', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get categorisations agency resource version
#' @description This function returns the content from ``/v1.0/categorisations/{agencyID}/{resourceID}/{version}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @examples
#' get_structuralresources_categorisations_agency_resource_version(
#' "ISTAC",
#' "cat2",
#' "01.000"
#' )
#' @export
get_structuralresources_categorisations_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('categorisations', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get category schemes
#' @description This function returns the content from ``/v1.0/categoryschemes``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes()
#' get_structuralresources_category_schemes(
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_category_schemes <- function(limit=25, offset=0, query='', orderby='') {
  path = 'categoryschemes'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get category schemes agency
#' @description This function returns the content from ``/v1.0/categoryschemes/{agencyID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency(
#' "ISTAC",
#' query="ID EQ 2090",
#' orderby="ID ASC"
#' )
#' @export
get_structuralresources_category_schemes_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
path = paste('categoryschemes', agencyid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get category schemes agency resource
#' @description This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency_resource(
#' "ISTAC",
#' "TEMAS_CANARIAS"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('categoryschemes', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get category schemes agency resource version
#' @description This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version(
#' "ISTAC",
#' "TEMAS_CANARIAS",
#' "01.000"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('categoryschemes', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get category schemes agency resource version categories
#' @description This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version_categories(
#' "ISTAC",
#' "TEMAS_CANARIAS",
#' "01.000"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version_categories <- function(agencyid, resourceid, version, limit=25, offset=0, query='', orderby='') {
  path = paste('categoryschemes', agencyid, resourceid, version, 'categories', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get category schemes agency resource version categories (id)
#' @description This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories/{categoryID}``
#' @param agencyid (string): Identifier of the agency that publishes.
#' @param resourceid (string): Resource identifier.
#' @param version (string): Specific version of the resource.
#' @param categoryid (string): category identifier.
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version_categories_id(
#' "ISTAC",
#' "TEMAS_CANARIAS",
#' "01.000",
#' "060"
#' )
#' get_structuralresources_category_schemes_agency_resource_version_categories_id(
#' "ISTAC",
#' "TEMAS_CANARIAS",
#' "01.000",
#' "060.060_010.060_010_010"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version_categories_id <- function(agencyid, resourceid, version, categoryid) {
  path = paste('categoryschemes', agencyid, resourceid, version, 'categories', categoryid, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}
