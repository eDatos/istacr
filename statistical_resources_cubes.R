# Instituto Canario de Estadística (ISTAC)

#' @title Get datasets
#' @description This function allows consulting all existing statistical data cubes.
#' @param lang (string) Language in which you want to get the answer.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned. By default \code{offset = 0}.
#' @param orderBy (string) Order. Possible values are \code{ID ASC} or \code{ID DESC},
#' @param query (string) Metadata query on which the searches can be built.
#' @examples
#' get_datasets()
#' @export
get_datasets <- function(lang = "es", limit = 25, offset = 0, orderBy = NULL, query = NULL) {

  # URL params
  api <- "statistical-resources"
  path <- "datasets"

  # Parse order
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Build URL
  params <- paste0("?lang=", lang, "&limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get datasets (agencyID)
#' @description This function allows to consult all the data sets maintained by a certain organization.
#' @param agencyID (string) Identifier of the maintainer organization of the resource. A possible value is \code{ISTAC}.
#' @param lang (string) Language in which you want to get the answer.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned. By default \code{offset = 0}.
#' @param orderBy (string) Order. Possible values are \code{ID ASC} or \code{ID DESC},
#' @param query (string) Metadata query on which the searches can be built.
#' @examples
#' get_datasets_agency(agencyID = "ISTAC")
#' @export
get_datasets_agency <- function(agencyID, lang = "es", limit = 25, offset = 0, orderBy = NULL, query = NULL) {

  # URL params
  api <- "statistical-resources"
  path <- "datasets"

  # Parse order
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Build URL
  params <- paste0("?lang=", lang, "&limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(agencyID, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get datasets (agencyID / resourceID)
#' @description This function allows to obtain all the versions of a statistical cube with a certain identifier and that also maintains a certain organization.
#' @param agencyID (string) Identifier of the maintainer organization of the resource. A possible value is \code{ISTAC}.
#' @param resourceID (string) Resource identifier. A possible value is \code{C00010A_000002}.
#' @param lang (string) Language in which you want to get the answer.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned. By default \code{offset = 0}.
#' @param orderBy (string) Order. Possible values are \code{ID ASC} or \code{ID DESC},
#' @param query (string) Metadata query on which the searches can be built.
#' @examples
#' get_datasets_agency_resource(agencyID = "ISTAC", resourceID = "C00010A_000002")
#' @export
get_datasets_agency_resource <- function(agencyID, resourceID, lang = "es", limit = 25, offset = 0, orderBy = NULL, query = NULL) {

  # URL params
  api <- "statistical-resources"
  path <- "datasets"

  # Parse order
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Build URL
  params <- paste0("?lang=", lang, "&limit=", limit, "&offset=", offset, "&orderBy=", orderBy, "&query=", query)
  resource <- paste0(agencyID, "/", resourceID, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get datasets (agencyID / resourceID / version)
#' @description This function allows to obtain all the versions of a statistical cube with a certain identifier and that also maintains a certain organization.
#' @param agencyID (string) Identifier of the maintainer organization of the resource. A possible value is \code{ISTAC}.
#' @param resourceID (string) Resource identifier. A possible value is \code{C00010A_000002}.
#' @param version (string) Resource version. A possible value is \code{001.000}.
#' @param dim (string) Allows filtering the data obtained in the response. A example is \code{TIME_PERIOD:2009|2010}.
#' @param fields (string) Allows you to customize the response by excluding fields from it. The possible values are \code{-metadata} and \code{-data}.
#' @param lang (string) Language in which you want to get the answer.
#' @examples
#' get_datasets_agency_resource_version(
#'    agencyID = "ISTAC", resourceID = "C00010A_000002", version = "001.000",
#'    fields = "-data,-metadata"
#' )
#' @export
get_datasets_agency_resource_version <- function(agencyID, resourceID, version, dim = NULL, fields = NULL, lang = "es") {

  # URL params
  api <- "statistical-resources"
  path <- "datasets"

  # Parse dim
  if (!is.null(dim)) {
    dim <- parse_param(dim)
  }

  # Parse fields
  if (!is.null(fields)) {
    fields <- parse_param(fields)
  }

  # Build URL
  params <- paste0("?dim=", dim, "&fields=", fields, "&lang=", lang)
  resource <- paste0(agencyID, "/", resourceID, "/", version, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}
