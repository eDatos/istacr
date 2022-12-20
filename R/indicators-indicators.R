#source('R/services.R')

INDICATORS_API = 'indicators'

#' @title Get indicators
#' @description This function returns a list of indicators published in the ISTAC-indicators database.
#' An indicator is a measure used to know the intensity of a phenomenon in spacetime. This
#' measure can refer to different spatial or temporal granularities.
#' @param q (string): Metadata query on which the searches can be built using ``id``, ``subjectCode`` or ``geographicValue``.
#' @param order (string): Order. Possible values are: ``update`` and ``id``. Order criteria are ``ASC`` and ``DESC``.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
#' @param fields (string): Use of the answer by adding new fields. Possible values are: ``+metadata``, ``+data`` and ``+observationsMetadata``.
#' @param representation (string): Allows filtering the observations by their value. Its use only makes sense when ``+data`` and/or ``+observationsMetadata`` has been included.
#' @examples
#' get_indicators(
#' q='id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
#' order="id ASC",
#' fields="+data",
#' representation="GEOGRAPHICAL[35003|35005], MEASURE[ABSOLUTE]"
#' )
#' @export
get_indicators <- function(q='', order='', limit=25, offset=0, fields='', representation='') {
  path = 'indicators'
  url = build_entrypoint_url(
    INDICATORS_API,path, query_list = list(q=q, order=order, limit=limit, offset=offset, fields=fields, representation=representation)
  )
  get_content(url)
}

#' @title Get indicators code
#' @description This function returns the metadata that describe the characteristics of a specific
#' indicator, allowing the compression of the measured fact; also through the data request
#' the complete data (for all spacetime) of the indicator is provided.
#' @param indicatorcode (string): an indicator code
#' @examples
#' get_indicators_code("AFILIACIONES")
#' get_indicators_code("PARO_REGISTRADO")
#' @export
get_indicators_code <- function(indicatorcode) {
  path = paste('indicators', indicatorcode, sep = '/')
  url = build_entrypoint_url(INDICATORS_API, path)
  get_content(url)
}

#' @title Get indicators code data
#' @description This function returns complete data (for all spacetime) of the indicator.
#' On the other hand, metadata describing the characteristics of a specific
#' indicator are offered through the metadata request, allowing the compression
#' of the measured fact.
#' @param indicatorcode (string): an indicator code
#' @param representation (string): Allows filtering the observations by their value.
#' @param granularity (string): Allows to filter the observations through the granularities of the same.
#' @param fields (string): Allows you to customize the response by excluding fields. The possible values are:
#' @param as_dataframe (bool): If True, this function returns a namedtuple with:
#'   - dataframe: pandas dataframe built from API response.
#'   - codelists: mapping between codes and representations for each column.
#' ``-observationsMetadata``.
#' @examples
#' get_indicators_code_data("AFILIACIONES")
#' @export
get_indicators_code_data <- function(indicatorcode, representation='', granularity='', fields='', as_dataframe=F) {
  path = paste('indicators', indicatorcode, 'data', sep = '/')
  url = build_entrypoint_url(
    INDICATORS_API, path, query_list = list(representation=representation, granularity=granularity, fields=fields)
  )
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_indicators_api_response(api_response))
  } else {
    return(api_response)
  }
}
