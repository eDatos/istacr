#source('R/services.R')

API = 'indicators'

#' @title Get geographic granularities
#' @description This function returns a list of geographic granularities treated in the
#' ISTAC-indicators database. For example provincial, insular or municipal granularity.
#' @examples
#' get_indicators_geographic_granularities()
#' @export
get_indicators_geographic_granularities <- function() {
  path = 'geographicGranularities'
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get geographical values
#' @description This function returns values of a geographical granularity that in turn are part of a
#' specific theme or system of indicators.
#' @param geographicalgranularitycode (string): geographical granularity code
#' @param subjectcode (string): subject code
#' @param systemcode (string): system code
#' @examples
#' get_indicators_geographical_values(
#' "REGIONS",
#' subjectcode="051",
#' systemcode="C00067A"
#' )
#' @export
get_indicators_geographical_values <- function(geographicalgranularitycode, subjectcode, systemcode='') {
  path = 'geographicalValues'
  url = build_entrypoint_url(
    API, path, query_list = list(geographicalGranularityCode=geographicalgranularitycode, subjectCode=subjectcode, systemCode=systemcode)
  )
  get_content(url)
}

#' @title Get subjects
#' @description This function returns all subjects which the ISTAC classifies its statistical
#' operations.
#' @examples
#' get_indicators_subjects()
#' @export
get_indicators_subjects <- function() {
  path = 'subjects'
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get time granularities
#' @description This function returns a list of temporary granularity treated in the ISTAC data
#' bank-indicators ordered from highest to lowest granularity. For example annual,
#' quarterly or monthly granularity.
#' @examples
#' get_indicators_time_granularities()
#' @export
get_indicators_time_granularities <- function() {
  path = 'timeGranularities'
  url = build_entrypoint_url(API, path)
  get_content(url)
}
