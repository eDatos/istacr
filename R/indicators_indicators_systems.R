# Instituto Canario de Estadística (ISTAC)

#' @title Get indicators systems
#' @description This function returns a list of indicator systems published in
#'  the ISTAC-indicators database. The indicators are simple or compound
#'  statistics, however a single indicator can rarely provide useful
#'  information about complex phenomena such as the economic situation,
#'  living conditions, schooling or others. Indicator systems are generally
#'  designed to generate more and more accurate information about the
#'  conditions of a phenomenon; and for this they are organized in dimensions
#'  or areas of analysis, under which the indicators are integrated.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned. By default \code{offset = 0}.
#' @examples
#' get_indicators_systems()
#' @export
get_indicators_systems <- function(limit = 25, offset = 0) {

  # Build URL
  api <- "indicators"
  path <- "indicatorsSystems"

  path <- paste0(path, "?limit=", limit, "&offset=", offset)
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators system code
#' @description This function returns metadata of a system of indicators
#'  published in the ISTAC-indicators database. The indicators are simple or
#'  compound statistics, however a single indicator can rarely provide useful
#'  information about complex phenomena such as the economic situation, living
#'  conditions, schooling or others.
#' @param indicatorSystemCode (string) an indicator system code
#' @examples
#' get_indicators_systems_code("C00075H")
#' @export
get_indicators_systems_code <- function(indicatorSystemCode) {

  # Build URL
  api <- "indicators"
  path <- "indicatorsSystems"
  resource <- indicatorSystemCode
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators system code instances
#' @description This function returns instances of indicators associated
#'  with a specific indicator system. An instance of an indicator is nothing
#'  more than a spatio-temporal query of an indicator when it is incorporated
#'  into a specific indicator system.
#' @param indicatorSystemCode (string) with an indicator system code
#' @param q (string) Query of metadata on which the searches can be built are:
#'  \code{id} and \code{geographicalValue}.
#' @param order (string) Order. Possible values are: \code{update} and
#'   \code{id} and order criteria are \code{ASC} and \code{DESC}.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param fields (string) Use of the answer by adding new fields.
#'  Possible values are: \code{+metadata}, \code{+data} and \code{+observationsMetadata}.
#' @param representation (string) Allows filtering the observations by their value.
#'  Its use only makes sense when \code{+data} and/or \code{+observationsMetadata} has been included.
#' @param granularity (string) Allows to filter the observations through the
#'  granularities of the same. Its use only makes sense when \code{+data} and/or
#'  \code{+observationsMetadata} has been included.
#' @examples
#' get_indicators_systems_code_instances("C00075H")
#' get_indicators_systems_code_instances("C00075H", q = 'id EQ "INDICADORES_MUNICIPALES"')
#' @export
get_indicators_systems_code_instances <- function(indicatorSystemCode, q = NULL, order = NULL, limit = 25, offset = 0, fields = NULL, representation = NULL, granularity = NULL) {

  # Parse order
  if (!is.null(order)) {
    order <- parse_param(order)
  }

  # Parse fields
  if (!is.null(fields)) {
    fields <- parse_param(fields)
  }

  # Parse representation
  if (!is.null(representation)) {
    representation <- parse_param(representation)
  }

  # Parse granularity
  if (!is.null(granularity)) {
    granularity <- parse_param(granularity)
  }

  # Build URL
  api <- "indicators"
  path <- "indicatorsSystems"
  resource <- paste0(indicatorSystemCode, "/indicatorsInstances")
  if (!is.null(q)) {
    q <- parse_param(q)
    params <- paste0("?q=", q, "&order=", order, "&limit=", limit, "&offset=", offset, "&fields=", fields, "&representation=", representation)
  } else {
    params <- paste0("?order=", order, "&limit=", limit, "&offset=", offset, "&fields=", fields, "&representation=", representation)
  }

  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators system code instances code
#' @description This function returns metadata of an indicator set associated
#'  with a specific indicator system. An instance of an indicator is nothing
#'  more than a spatio-temporal query of an indicator when it is incorporated
#'  into a specific indicator system.
#' @param indicatorSystemCode (string) indicator system code
#' @param indicatorInstanceCode (string) indicator instance code
#' @examples
#' get_indicators_systems_code_instances_code("C00075H", "21af0477-d63b-493b-ad02-4ab181547223")
#' @export
get_indicators_systems_code_instances_code <- function(indicatorSystemCode, indicatorInstanceCode) {

  # Build URL
  api <- "indicators"
  path <- "indicatorsSystems"
  resource <- paste0(indicatorSystemCode, "/indicatorsInstances/", indicatorInstanceCode)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators system code instances code data
#' @description This function returns data of an indicator unit associated with
#'  a specific indicator system. An instance of an indicator is nothing more
#'  than a spatio-temporal query of an indicator when it is incorporated into
#'  a specific indicator system.
#' @param indicatorSystemCode (string) Indicator system code
#' @param indicatorInstanceCode (string) Indicator instance code
#' @param representation (string) Allows filtering the observations by their value.
#' @param granularity (string) Allows to filter the observations through the granularities of the same.
#' @param fields (string) Allows you to customize the response by excluding fields. The possible values are: \code{-observationsMetadata}.
#' @examples
#' get_indicators_systems_code_instances_code_data("C00075H", "21af0477-d63b-493b-ad02-4ab181547223")
#' @export
get_indicators_systems_code_instances_code_data <- function(indicatorSystemCode, indicatorInstanceCode, representation = NULL, granularity = NULL, fields = NULL) {

  # Parse representation
  if (!is.null(representation)) {
    representation <- parse_param(representation)
  }

  # Parse granularity
  if (!is.null(granularity)) {
    granularity <- parse_param(granularity)
  }

  # Parse fields
  if (!is.null(fields)) {
    fields <- parse_param(fields)
  }

  # Build URL
  api <- "indicators"
  path <- "indicatorsSystems"
  resource <- paste0(indicatorSystemCode, "/indicatorsInstances/", indicatorInstanceCode, "/data")
  params <- paste0("?representation=", representation, "&granularity=", granularity, "&fields=", fields)
  resource <- paste0(resource, params)
  url <- get_url(api, path, resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}
