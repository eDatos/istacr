#source('R/services.R')

API = 'indicators'

#' @title Get indicators systems
#' @description This function returns a list of indicator systems published in the ISTAC-indicators
#' database. The indicators are simple or compound statistics, however a single indicator
#' can rarely provide useful information about complex phenomena such as the economic
#' situation, living conditions, schooling or others. Indicator systems are generally
#' designed to generate more and more accurate information about the conditions of a
#' phenomenon; and for this they are organized in dimensions or areas of analysis, under
#' which the indicators are integrated.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @examples
#' get_indicators_systems()
#' @export
get_indicators_systems <- function(limit=25, offset=0) {
  path = 'indicatorsSystems'
  url = build_entrypoint_url(API, path, query_list = list(limit=limit, offset=offset))
  get_content(url)
}

#' @title Get indicators system code
#' @description This function returns metadata of a system of indicators published in the
#' ISTAC-indicators database. The indicators are simple or compound statistics, however a
#' single indicator can rarely provide useful information about complex phenomena such as
#' the economic situation, living conditions, schooling or others.
#' @param indicatorsystemcode (string): an indicator system code
#' @examples
#' get_indicators_systems_code("C00075H")
#' @export
get_indicators_systems_code <- function(indicatorsystemcode) {
  path = paste('indicatorsSystems', indicatorsystemcode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get indicators system code instances
#' @description This function returns instances of indicators associated with a specific indicator
#' system. An instance of an indicator is nothing more than a spatio-temporal query of an
#' indicator when it is incorporated into a specific indicator system.
#' @param indicatorsystemcode (string): with an indicator system code
#' @param q (string): Query of metadata on which the searches can be built are: ``id`` and ``geographicalValue``.
#' @param order (string): Order. Possible values are: ``update`` and ``id`` and order criteria are ``ASC`` and ``DESC``.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
#' @param fields (string): Use of the answer by adding new fields. Possible values are: ``+metadata``, ``+data`` and ``+observationsMetadata``.
#' @param representation (string): Allows filtering the observations by their value. Its use only makes sense when ``+data`` and/or ``+observationsMetadata`` has been included.
#' @param granularity (string): Allows to filter the observations through the granularities of the same. Its use only makes sense when ``+data`` and/or ``+observationsMetadata`` has been included.
#' @examples
#' get_indicators_systems_code_instances("C00075H")
#' get_indicators_systems_code_instances(
#' "C00075H",
#' q='id EQ "INDICADORES_MUNICIPALES"'
#' )
#' @export
get_indicators_systems_code_instances <- function(indicatorsystemcode, q='', order='', limit=25, offset=0, fields='', representation='', granularity='') {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(q=q, order=order, limit=limit, offset=offset, fields=fields, representation=representation, granularity=granularity)
  )
  get_content(url)
}

#' @title Get indicators system code instances code
#' @description This function returns metadata of an indicator set associated with a specific indicator
#' system. An instance of an indicator is nothing more than a spatio-temporal query of an
#' indicator when it is incorporated into a specific indicator system.
#' @param indicatorsystemcode (string) indicator system code
#' @param indicatorinstancecode (string) indicator instance code
#' @examples
#' get_indicators_systems_code_instances_code(
#' "C00075H",
#' "21af0477-d63b-493b-ad02-4ab181547223"
#' )
#' @export
get_indicators_systems_code_instances_code <- function(indicatorsystemcode, indicatorinstancecode) {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances',indicatorinstancecode, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

#' @title Get indicators system code instances code data
#' @description This function returns metadata of an indicator set associated with a specific indicator
#' system. An instance of an indicator is nothing more than a spatio-temporal query of an
#' indicator when it is incorporated into a specific indicator system.
#' @param indicatorsystemcode (string): Indicator system code
#' @param indicatorinstancecode (string): Indicator instance code
#' @param representation (string): Allows filtering the observations by their value.
#' @param granularity (string): Allows to filter the observations through the granularities of the same.
#' @param fields (string): Allows you to customize the response by excluding fields. The possible values are: ``-observationsMetadata``.
#' @examples
#' get_indicators_systems_code_instances_code_data(
#' "C00075H",
#' "21af0477-d63b-493b-ad02-4ab181547223"
#' )
#' @export
get_indicators_systems_code_instances_code_data <- function(indicatorsystemcode, indicatorinstancecode, representation='', granularity='', fields='') {
  path = paste('indicatorsSystems', indicatorsystemcode, 'indicatorsInstances', indicatorinstancecode, 'data', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(representation=representation, granularity=granularity, fields=fields)
  )
  get_content(url)
}

