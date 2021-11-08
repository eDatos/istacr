API = 'indicators'

get_indicators_geographic_granularities <- function() {
  path = 'geographicGranularities'
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_indicators_geographical_values <- function(geographicalgranularitycode, subjectcode, systemcode='') {
  path = 'geographicalValues'
  url = build_entrypoint_url(
    API, path, query_list = list(geographicalGranularityCode=geographicalgranularitycode, subjectCode=subjectcode, systemCode=systemcode)
  )
  get_content(url)
}

get_indicators_subjects <- function() {
  path = 'subjects'
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_indicators_time_granularities <- function() {
  path = 'timeGranularities'
  url = build_entrypoint_url(API, path)
  get_content(url)
}
