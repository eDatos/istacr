# Instituto Canario de Estadística (ISTAC)


#' @title Get geographic granularities
#' @description This function returns a list of geographic granularities treated
#'  in the ISTAC-indicators database. For example provincial, insular or
#'  municipal granularity.
#' @examples
#' get_indicators_geographic_granularities()
#' @export
get_indicators_geographic_granularities <- function() {

  # Build URL
  api <- "indicators"
  path <- "geographicGranularities"
  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get geographical values
#' @description This function returns values of a geographical granularity that
#'  in turn are part of a specific theme or system of indicators.
#' @param geographicalGranularityCode (string) geographical granularity code
#' @param subjectCode (string) subject code
#' @param systemCode (string) system code
#' @examples
#' get_indicators_geographical_values("REGIONS")
#' get_indicators_geographical_values("REGIONS", subjectCode = "051", systemCode = "C00067A")
#' @export
get_indicators_geographical_values <- function(geographicalGranularityCode, subjectCode = NULL, systemCode = NULL) {

  # Build URL
  api <- "indicators"
  path <- "geographicalValues"
  if (!is.null(subjectCode)) {
    if (!is.null(systemCode)) {
      path <- paste0(path, "?subjectCode=", subjectCode, "&systemCode=", systemCode, "&geographicalGranularityCode=", geographicalGranularityCode)
    } else {
      path <- paste0(path, "?subjectCode=", subjectCode, "&geographicalGranularityCode=", geographicalGranularityCode)
    }
  } else {
    if (!is.null(systemCode)) {
      path <- paste0(path, "?systemCode=", systemCode, "&geographicalGranularityCode=", geographicalGranularityCode)
    } else {
      path <- paste0(path, "?geographicalGranularityCode=", geographicalGranularityCode)
    }
  }

  url <- get_url(api, path)

  # Get content
  content <- fromJSON(url)

  return(content)
}

#' @title Get subjects
#' @description This function returns all subjects which the ISTAC classifies
#'  its statistical operations.
#' @examples
#' get_indicators_subjects()
#' @export
get_indicators_subjects <- function() {

  # Build URL
  api <- "indicators"
  path <- "subjects"

  # Get content
  url <- get_url(api, path)
  content <- fromJSON(url)

  return(content)
}

#' @title Get time granularities
#' @description This function returns a list of temporary granularity treated
#'  in the ISTAC data bank-indicators ordered from highest to lowest granularity.
#'  For example annual, quarterly or monthly granularity.
#' @examples
#' get_indicators_time_granularities()
#' @export
get_indicators_time_granularities <- function() {

  # Build URL
  api <- "indicators"
  path <- "timeGranularities"

  # Get content
  url <- get_url(api, path)
  content <- fromJSON(url)

  return(content)
}
