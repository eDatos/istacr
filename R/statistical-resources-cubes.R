#source('R/services.R')

STATISTICAL_RESOURCES_API = 'statistical-resources'

#' @title Get datasets
#' @description This function allows consulting all existing statistical data cubes.
#' @param lang (string): Language in which you want to get the answer.
#' @param limit (int): Results limit. By default ``limit=25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
#' @param query (string): Metadata query on which the searches can be built.
#' @import jsonlite
#' @examples
#' get_statisticalresources_datasets(limit=5)
#' @export
get_statisticalresources_datasets <- function(lang='es', limit=25, offset=0, orderby='', query='') {
  path = 'datasets'
  url = build_entrypoint_url(
    STATISTICAL_RESOURCES_API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

#' @title Get datasets (agencyID)
#' @description This function allows to consult all the data sets maintained by a certain organization.
#' @param agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
#' @param lang (string): Language in which you want to get the answer.
#' @param limit (int): Results limit. By default ``limit=25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
#' @param query (string): Metadata query on which the searches can be built.
#' @import jsonlite
#' @examples
#' get_statisticalresources_datasets_agency(agencyid="ISTAC")
#' @export
get_statisticalresources_datasets_agency <- function(agencyid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('/datasets/', agencyid)
  url = build_entrypoint_url(
    STATISTICAL_RESOURCES_API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

#' @title Get datasets (agencyID / resourceID)
#' @description This function allows to obtain all the versions of a statistical cube with a certain
#' identifier and that also maintains a certain organization.
#' @param agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
#' @param resourceid (string): Resource identifier. A possible value is ``C00010A_000002``.
#' @param lang (string): Language in which you want to get the answer.
#' @param limit (int): Results limit. By default ``limit=25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
#' @param orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
#' @param query (string): Metadata query on which the searches can be built.
#' @import jsonlite
#' @examples
#' get_statisticalresources_datasets_agency_resource(
#' agencyid="ISTAC",
#' resourceid="C00010A_000002"
#' )
#' @export
get_statisticalresources_datasets_agency_resource <- function(agencyid, resourceid, lang='es', limit=25, offset=0, orderby='', query='') {
  path = paste0('/datasets/', agencyid, '/', resourceid)
  url = build_entrypoint_url(
    STATISTICAL_RESOURCES_API, path, query_list = list(lang=lang, limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

#' @title Get datasets (agencyID / resourceID / version)
#' @description This function allows to obtain a certain version of a statistical cube with a certain
#' identifier and that also maintains a certain organization.
#' @param agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
#' @param resourceid (string): Resource identifier. A possible value is ``C00010A_000002``.
#' @param version (string): Resource version. A possible value is ``001.000``.
#' @param dim (string): Allows filtering the data obtained in the response. A example is ``TIME_PERIOD:2009|2010``.
#' @param fields (string): Allows you to customize the response by excluding fields from it. The possible values are ``-metadata`` and ``-data``.
#' @param lang (string): Language in which you want to get the answer.
#' @param as_dataframe (bool): If True, this function returns a namedtuple with:
#'   - dataframe: pandas dataframe built from API response.
#'   - codelists: mapping between codes and representations for each column.
#' @examples
#' get_statisticalresources_datasets_agency_resource_version(
#' agencyid="ISTAC",
#' resourceid="C00010A_000012",
#' version="001.000",
#' dim="TIME_PERIOD:2009")
#' @export
get_statisticalresources_datasets_agency_resource_version <- function(agencyid, resourceid, version, dim='', fields='', lang='es', as_dataframe=F) {
  path = paste('datasets', agencyid, resourceid, version, sep = "/")
  url = build_entrypoint_url(STATISTICAL_RESOURCES_API, path, query_list = list(dim=dim, fields=fields, lang=lang))
  api_response = get_content(url)
  if(as_dataframe) {
    return(build_resolved_api_response(api_response))
  } else {
    return(api_response)
  }
}
