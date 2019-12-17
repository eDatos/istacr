# Instituto Canario de Estadística (ISTAC)

#' @title Get indicators
#' @description This function returns a list of indicators published in the
#'  ISTAC-indicators database. An indicator is a measure used to know the
#'  intensity of a phenomenon in spacetime. This measure can refer to
#'  different spatial or temporal granularities.
#' @param q (string) Metadata query on which the searches can be built using:
#'   \code{id}, \code{subjectCode} or \code{geographicValue}.
#' @param order (string) Order. Possible values are: \code{update} and
#'   \code{id} and order criteria are \code{ASC} and \code{DESC}.
#' @param limit (int) Results limit. By default \code{limit = 25}.
#' @param offset (int) Displacement. Result from which it is returned.  By default \code{offset = 0}.
#' @param fields (string) Use of the answer by adding new fields.
#'  Possible values are: \code{+metadata}, \code{+data} and \code{+observationsMetadata}.
#' @param representation (string) Allows filtering the observations by their value.
#'  Its use only makes sense when \code{+data} and/or \code{+observationsMetadata} has been included.
#' @examples
#' indicators <- get_indicators(
#'   q = 'id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
#'   order = "id ASC", fields = "+data", representation =
#'     "GEOGRAPHICAL[35003|35005],MEASURE[ABSOLUTE]"
#' )
#' @export
get_indicators <- function(q = NULL, order = NULL, limit = 25, offset = 0, fields = NULL, representation = NULL) {

  # URL params
  api <- "indicators"
  path <- "indicators"

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

  # Get indicators using query (q) parameter
  if (!is.null(q)) {
    q <- parse_param(q)
    params <- paste0("&order=", order, "&limit=", limit, "&offset=", offset, "&fields=", fields, "&representation=", representation)
    path <- paste0(path, "?q=", q, params)
  } else {
    params <- paste0("?order=", order, "&limit=", limit, "&offset=", offset, "&fields=", fields, "&representation=", representation)
    path <- paste0(path, params)
  }

  url <- get_url(api, path)
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators code
#' @description This function returns the metadata that describe the characteristics
#'  of a specific indicator, allowing the compression of the measured fact;
#'  also through the data request the complete data (for all spacetime) of the
#'  indicator is provided.
#' @param indicatorCode (string) an indicator code
#' @examples
#' get_indicators_code("AFILIACIONES")
#' get_indicators_code("PARO_REGISTRADO")
#' @export
get_indicators_code <- function(indicatorCode) {

  # URL params
  api <- "indicators"
  path <- "indicators"

  url <- get_url(api, path, resource = indicatorCode)
  content <- fromJSON(url)

  return(content)
}

#' @title Get indicators code data
#' @description This function returns complete data (for all spacetime) of the indicator.
#'  On the other hand, metadata describing the characteristics of a specific
#'  indicator are offered through the metadata request, allowing the compression
#'  of the measured fact.
#' @param indicatorCode (string) an indicator code
#' @param representation (string) Allows filtering the observations by their value.
#' @param granularity (string) Allows to filter the observations through the granularities of the same.
#' @param fields (string) Allows you to customize the response by excluding fields.
#'  The possible values are: \code{-observationsMetadata}.
#' @examples
#' get_indicators_code_data("AFILIACIONES", fields = "-observationsMetadata")
#' @export
get_indicators_code_data <- function(indicatorCode, representation = NULL, granularity = NULL, fields = NULL) {

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
  path <- "indicators"
  resource <- paste0(indicatorCode, "/data", "?representation=", representation, "&granularity=", granularity, "&fields=", fields)
  url <- get_url(api, path, resource = resource)

  # Get content
  content <- fromJSON(url)

  return(content)
}
