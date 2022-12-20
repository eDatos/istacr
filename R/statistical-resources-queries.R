#source('R/services.R')

STATISTICAL_RESOURCES_API = 'statistical-resources'

#' @title Get queries
#' @description This function allows consulting all existing statistical queries.
#' @param lang (string): Language in which you want to get the answer.
#' @param limit (int): Results limit. By default ``limit=25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``,
#' @param query (string): Metadata query on which the searches can be built.
#' @examples
#' get_statisticalresources_queries(limit=5)
#' @export
get_statisticalresources_queries <- function(lang='es', limit=25, offset=0, orderby='', query='') {
  path = 'queries'
  url = build_entrypoint_url(
    STATISTICAL_RESOURCES_API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

#' @title Get queries (agencyID)
#' @description This function allows to consult all the queries maintained by a certain organization.
#' @param agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
#' @param lang (string): Language in which you want to get the answer.
#' @param limit (int): Results limit. By default ``limit=25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``,
#' @param query (string): Metadata query on which the searches can be built.
#' @examples
#' get_statisticalresources_queries_agency(agencyid="ISTAC", limit=5)
#' @export
get_statisticalresources_queries_agency <- function(agencyid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('queries/', agencyid)
  url = build_entrypoint_url(STATISTICAL_RESOURCES_API, path, list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query))
  get_content(url)
}

#' @title Get queries (agencyID / resourceID)
#' @description This function allows to obtain final data of a statistical query with a certain identifier and that also maintains a certain organization.
#' @param agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
#' @param resourceid (string): Resource identifier. A possible value is ``C00005A_000004``.
#' @param fields (string): Allows you to customize the response by excluding fields from it.
#'   - The possible values are ``-metadata`` and ``-data``.
#' @param lang (string): Language in which you want to get the answer.
#' @param as_dataframe (bool): If True, this function returns a namedtuple with:
#'   - dataframe: pandas dataframe built from API response.
#'   - codelists: mapping between codes and representations for each column.
#' @examples
#' get_statisticalresources_queries_agency_resource(
#' agencyid="ISTAC",
#' resourceid="C00005A_000004"
#' )
#' @export
get_statisticalresources_queries_agency_resource <- function(agencyid,  resourceid, fields='', lang='es', as_dataframe=FALSE) {
  path = paste0('queries/', agencyid, '/', resourceid)
  url = build_entrypoint_url(STATISTICAL_RESOURCES_API, path, list(fields=fields, lang=lang))
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_api_response(api_response))
  } else {
    return(api_response)
  }
}
