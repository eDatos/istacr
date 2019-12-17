# Instituto Canario de Estadística (ISTAC)

#' @title Get concept types
#' @description This function returns the content from /v1.0/conceptTypes
#' @examples
#' get_structuralresources_concept_types()
#' @export
get_structuralresources_concept_types <- function() {

  # Build URL
  api <- "structural-resources"
  path <- "conceptTypes"
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get concept schemes
#' @description This function returns the content from /v1.0/conceptschemes
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes()
#' get_structuralresources_concept_schemes(query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_concept_schemes <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "conceptschemes"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get concept schemes agency
#' @description This function returns the content from /v1.0/conceptschemes/{agencyID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes_agency("ISTAC")
#' get_structuralresources_concept_schemes_agency("ESTAT", query = "ID EQ 2090", orderBy = "ID ASC")
#' @export
get_structuralresources_concept_schemes_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "conceptschemes"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get concept schemes agency resource
#' @description This function returns the content from /v1.0/conceptschemes/{agencyID}/{resourceID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource(
#'    agencyID = "ISTAC", resourceID = "CL_AREA_ES"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "conceptschemes"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get concept schemes agency resource version
#' @description This function returns the content from /v1.0/conceptschemes/{agencyID}/{resourceID}/{version}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version(
#'    agencyID = "ISTAC", resourceID = "CL_AREA", version = "01.000"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version <- function(agencyID, resourceID, version) {


  # Build URL
  api <- "structural-resources"
  path <- "conceptschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}

#' @title Get concept schemes agency resource version concepts
#' @description This function returns the content from /v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version_concepts(
#'    agencyID = "ISTAC", resourceID = "CL_AREA_ES", version = "01.000"
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version_concepts <- function(agencyID, resourceID, version, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "conceptschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/concepts")
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}

#' @title Get concept schemes agency resource version concepts (id)
#' @description This function returns the content from /v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts/{conceptID}
#' @param agencyID (string) Identifier of the agency that publishes.
#' @param resourceID (string) Resource identifier.
#' @param version (string) Specific version of the resource.
#' @param conceptID (string) Concept identifier.
#' @examples
#' get_structuralresources_concept_schemes_agency_resource_version_concepts_id(
#'    agencyID = "ISTAC", resourceID = "CL_AREA_ES", version = "01.000", conceptID = 0
#' )
#' @export
get_structuralresources_concept_schemes_agency_resource_version_concepts_id <- function(agencyID, resourceID, version, conceptID) {

  # Build URL
  api <- "structural-resources"
  path <- "conceptschemes"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/concepts/", conceptID)
  url <- get_url(api, path, resource)

  # Get content
  # content <- fromJSON(url)

  return(url)
}
