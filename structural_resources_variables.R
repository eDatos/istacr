# Instituto Canario de Estadística (ISTAC)

#' @title Get variable families
#' @description This function returns data from /v1.0/variablefamilies
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_variable_families()
#' @export
get_structuralresources_variable_families <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <-  "structural-resources"
  path <- "variablefamilies"
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  path <- paste0(path, params)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variable families (id)
#' @description This function returns data from /v1.0/variablefamilies/{id}
#' @param id (string) Variable family identificator.
#' @examples
#' get_structuralresources_variable_families_id("VRF_DEMOGRAFICAS")
#' @export
get_structuralresources_variable_families_id <- function(id) {

  # Build URL
  api <-  "structural-resources"
  path <- "variablefamilies"
  resource <- id
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variable families (id) variables
#' @description This function returns data from /v1.0/variablefamilies/{id}/variables
#' @param id (string) Variable family identificator.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_variable_families_id_variables("VRF_DEMOGRAFICAS")
#' @export
get_structuralresources_variable_families_id_variables <- function(id, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <-  "structural-resources"
  path <- "variablefamilies"
  resource <- paste0(id, "/variables")
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variables
#' @description This function returns data from /v1.0/variables
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_variables()
#' @export
get_structuralresources_variables <- function(limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <-  "structural-resources"
  path <- "variables"
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variables (id)
#' @description This function returns data from /v1.0/variables/{id}
#' @param id (string) Variable identificator.
#' @examples
#' get_structuralresources_variables_id("VR_SEXO")
#' @export
get_structuralresources_variables_id <- function(id) {

  # Build URL
  api <-  "structural-resources"
  path <- "variables"
  resource <- id
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variableelements
#' @description This function returns data from /v1.0/variables/{variableID}/variableelements
#' @param variableID (string) Variable identificator.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_variableelements("VR_SEXO")
#' @export
get_structuralresources_variableelements <- function(variableID, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <-  "structural-resources"
  path <- "variables"
  resource <- paste0(variableID, "/variableelements")
  params <- paste0("?limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get variableelements resource
#' @description This function returns data from /v1.0/variables/{variableID}/variableelements/{resourceID}
#' @param resourceID (string) Resource identificator.
#' @param variableID (string) Variable identificator.
#' @examples
#' get_structuralresources_variableelements_resource("VR_SEXO", "FEMALE")
#' get_structuralresources_variableelements_resource("VR_TERRITORIO", "CCAA_CANARIAS")
#' @export
get_structuralresources_variableelements_resource <- function(variableID, resourceID) {

  # Build URL
  api <-  "structural-resources"
  path <- "variables"
  resource <- paste0(variableID, "/variableelements/", resourceID)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}

#' @title Get geoinfo
#' @description This function returns data from /v1.0/variables/{variableID}/variableelements/{resourceID}/geoinfo
#' @param variableID (string) Variable identificator.
#' @param resourceID (string) Resource identificator.
#' @param fields (string) Additional fields that you want to show in the answer.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param query (string) Query to filter the results.
#' @param orderBy (string) Field by which to sort the results.
#' @examples
#' geoinfo <- get_structuralresources_geoinfo("VR_TERRITORIO", "MUN_ICOD_VINOS")
#' @export
get_structuralresources_geoinfo <- function(variableID, resourceID, fields = NULL, limit = 25, offset = 0, query = NULL, orderBy = NULL) {

  # Parse fields
  if (!is.null(fields)) {
    fields <- parse_param(fields)
  }

  # Parse query
  if (!is.null(query)) {
    query <- parse_param(query)
  }

  # Parse orderBy
  if (!is.null(orderBy)) {
    orderBy <- parse_param(orderBy)
  }

  # Build URL
  api <-  "structural-resources"
  path <- "variables"
  resource <- paste0(variableID, "/variableelements/", resourceID, "/geoinfo")
  params <- paste0("?fields=", fields, "&limit=", limit, "&offset=", offset, "&query=", query, "&orderBy=", orderBy)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)

}
