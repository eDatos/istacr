# Instituto Canario de Estadística (ISTAC)

#' @title Get codelist families
#' @description This function returns the list of families of classifications
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param orderBy (string) Field by which to sort the results.
#' @param query (string) Query to filter the results.
#' @examples
#' get_structuralresources_codelist_families()
#' @export
get_structuralresources_codelist_families <- function(limit = 25, offset = 0, orderBy = NULL, query = NULL) {

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Build URL
  api <- "structural-resources"
  path <- "codelistfamilies"
  params <- paste0("?limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelist families
#' @description This function allows to obtain a family of classifications in particular.
#' @param id (string) codelist family identificator
#' @examples
#' get_structuralresources_codelist_families_id()
#' @export
get_structuralresources_codelist_families_id <- function(id = NULL) {

  # Build URL
  api <- "structural-resources"
  path <- "codelistfamilies"
  resource <- id
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists
#' @description This function allows to obtain the list of classifications.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists()
#' @export
get_structuralresources_codelists <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "codelists"
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists agency
#' @description This function allows obtaining the list of all the classifications
#'  maintained by a certain organization.
#' @param agencyID (string) Agency identificator.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists_agency("ISTAC")
#' get_structuralresources_codelists_agency("ESTAT")
#' @export
get_structuralresources_codelists_agency <- function(agencyID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "codelists"
  resource <- agencyID
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists agency resource
#' @description This function allows to obtain all the versions of a
#'  classification with a certain identifier and that is also kept by a
#'  certain organization.
#' @param agencyID (string) Agency identificator.
#' @param resourceID (string) Resource identificator.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists_agency_resource("ISTAC", "CL_AREA_ES")
#' @export
get_structuralresources_codelists_agency_resource <- function(agencyID, resourceID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

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
  path <- "codelists"
  resource <- paste0(agencyID, "/", resourceID)
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get Content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists agency resource version
#' @description This function allows you to consult a particular version of a classification.
#' @param agencyID (string) Agency identificator.
#' @param resourceID (string) Resource identificator.
#' @param version (string) Specific resource version.
#' @examples
#' get_structuralresources_codelists_agency_resource_version("ISTAC", "CL_AREA_ES", "01.000")
#' @export
get_structuralresources_codelists_agency_resource_version <- function(agencyID, resourceID, version) {

  # Build URL
  api <- "structural-resources"
  path <- "codelists"
  resource <- paste0(agencyID, "/", resourceID, "/", version)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists agency resource version codes
#' @description This function allows to consult the codes of a version of a
#'  classification. Note that if wildcards are used as \code{~all} or one of the
#'  \code{limit}, \code{offset}, \code{query} or \code{orderBy} parameters,
#'  the list will be automatically paginated.
#' @param agencyID (string) Agency identificator.
#' @param resourceID (string) Resource identificator.
#' @param version (string) Specific resource version.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @param openness (string) Opening established for viewing.
#' @param order (string) Order established for visualization.
#' @param fields (string) Additional fields that you want to show in the answer.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_codes("ISTAC", "CL_AREA_ES", "01.000")
#' @export
get_structuralresources_codelists_agency_resource_version_codes <- function(agencyID, resourceID, version, limit = 25, offset = 0, query = NULL, orderBy = NULL, openness = NULL, order = NULL, fields = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Parse fields
  if (!is.null(fields)) {
    fields <- parse_param(fields)
  }

  # Build URL
  api <- "structural-resources"
  path <- "codelists"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/codes")
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy, "&openness=", openness, "&order=", order, "&fields=", fields)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get codelists agency resource version codes (codeID)
#' @description This function allows to consult a specific code of a version of a classification.
#' @param agencyID (string) Agency identificator.
#' @param resourceID (string) Resource identificator.
#' @param version (string) Specific resource version.
#' @param codeID (string) Code identificator.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_codes_codeid(
#'    "ISTAC", "CL_AREA_ES", "01.000", "ES706A01"
#' )
#' @export
get_structuralresources_codelists_agency_resource_version_codes_codeid <- function(agencyID, resourceID, version, codeID) {

  # Build URL
  api <- "structural-resources"
  path <- "codelists"
  resource <- paste0(agencyID, "/", resourceID, "/", version, "/codes/", codeID)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}
