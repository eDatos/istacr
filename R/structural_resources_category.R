# Instituto Canario de Estadística (ISTAC)

#' @title Get categorisations
#' @description This function returns the content from /v1.0/categorisations
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations()
#' get_structuralresources_categorisations(query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_categorisations <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categorisations"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get categorisations agency
#' @description This function returns the content from /v1.0/categorisations/{agencyID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations_agency("ISTAC")
#' @export
get_structuralresources_categorisations_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categorisations"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get categorisations agency resource
#' @description This function returns the content from /v1.0/categorisations/{agencyID}/{resourceID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_categorisations_agency_resource("ISTAC", "cat2")
#' @export
get_structuralresources_categorisations_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categorisations"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get categorisations agency resource version
#' @description This function returns the content from /v1.0/categorisations/{agencyID}/{resourceID}/{version}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_categorisations_agency_resource_version("ISTAC", "cat2", "01.000")
#' @export
get_structuralresources_categorisations_agency_resource_version <- function(agencyID, resourceID, version) {

  # Build URL
  api <- "structural-resources"
  path <- "categorisations"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes
#' @description This function returns the content from /v1.0/categoryschemes
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes()
#' get_structuralresources_category_schemes(query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_category_schemes <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes agency
#' @description This function returns the content from /v1.0/categoryschemes/{agencyID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency("ISTAC", query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_category_schemes_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes agency resource
#' @description This function returns the content from /v1.0/categoryschemes/{agencyID}/{resourceID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency_resource("ISTAC", "TEMAS_CANARIAS")
#' @export
get_structuralresources_category_schemes_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes agency resource version
#' @description This function returns the content from /v1.0/categoryschemes/{agencyID}/{resourceID}/{version}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version(
#'    "ISTAC", "TEMAS_CANARIAS", "01.000"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version <- function(agencyID, resourceID, version) {

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes agency resource version categories
#' @description This function returns the content from /v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version_categories(
#'    "ISTAC", "TEMAS_CANARIAS", "01.000"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version_categories <- function(agencyID, resourceID, version, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/categories")
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get category schemes agency resource version categories (id)
#' @description This function returns the content from /v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories/{categoryID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @param categoryID (string)
#' @examples
#' get_structuralresources_category_schemes_agency_resource_version_categories_id(
#'    "ISTAC", "TEMAS_CANARIAS", "01.000", "060"
#' )
#' get_structuralresources_category_schemes_agency_resource_version_categories_id(
#'    "ISTAC", "TEMAS_CANARIAS", "01.000", "060.060_010.060_010_010"
#' )
#' @export
get_structuralresources_category_schemes_agency_resource_version_categories_id <- function(agencyID, resourceID, version, categoryID) {

  # Build URL
  api <- "structural-resources"
  path <- "categoryschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/categories/", categoryID)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}
