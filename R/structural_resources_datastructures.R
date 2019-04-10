# Instituto Canario de Estadística (ISTAC)

#' @title Get content constraints
#' @description This function returns the content from /v1.0/contentConstraints
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints()
#' get_structuralresources_content_constraints(query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_content_constraints <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "contentConstraints"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get content constraints agency
#' @description This function returns the content from /v1.0/contentConstraints/{agencyID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints_agency("ISTAC")
#' @export
get_structuralresources_content_constraints_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "contentConstraints"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get content constraints agency resource
#' @description This function returns the content from /v1.0/contentConstraints/{agencyID}/{resourceID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_content_constraints_agency_resource("ISTAC", "CL_AREA")
#' @export
get_structuralresources_content_constraints_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "contentConstraints"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get content constraints agency resource version
#' @description This function returns the content from /v1.0/contentConstraints/{agencyID}/{resourceID}/{version}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_content_constraints_agency_resource_version("ISTAC", "CL_AREA", "01.000")
#' @export
get_structuralresources_content_constraints_agency_resource_version <- function(agencyID, resourceID, version) {


  # Build URL
  api <- "structural-resources"
  path <- "contentConstraints"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}

#' @title Get content constraints agency resource version regions
#' @description This function returns the content from /v1.0/contentConstraints/{agencyID}/{resourceID}/{version}/regions/{regionCode}
#' @param regionCode (string) Region code.
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_content_constraints_agency_resource_version_regions(
#'    "0001", "ISTAC", "CL_AREA", "01.000"
#' )
#' @export
get_structuralresources_content_constraints_agency_resource_version_regions <- function(regionCode, agencyID, resourceID, version) {


  # Build URL
  api <- "structural-resources"
  path <- "contentConstraints"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/regions/", regionCode)
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}

#' @title Get data structures
#' @description This function returns the content from /v1.0/datastructures
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures()
#' get_structuralresources_data_structures(query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_data_structures <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "datastructures"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get data structures agency
#' @description This function returns the content from /v1.0/datastructures/{agencyID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures_agency("ISTAC")
#' @export
get_structuralresources_data_structures_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "datastructures"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}


#' @title Get data structures agency resource
#' @description This function returns the content from /v1.0/datastructures/{agencyID}/{resourceID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_data_structures_agency_resource("ISTAC", "CL_AREA")
#' @export
get_structuralresources_data_structures_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "datastructures"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get data structures agency resource version
#' @description This function returns the content from /v1.0/datastructures/{agencyID}/{resourceID}/{version}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_data_structures_agency_resource_version("ISTAC", "CL_AREA", "01.000")
#' @export
get_structuralresources_data_structures_agency_resource_version <- function(agencyID, resourceID, version) {

  # Build URL
  api <- "structural-resources"
  path <- "datastructures"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}
