#source('R/services.R')

STRUCTURAL_RESOURCES_API = 'structural-resources'

#' @title Get variable families
#' @description This function returns data from ``/v1.0/variablefamilies``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_variable_families()
#' @export
get_structuralresources_variable_families <- function(limit=25, offset=0, query='', orderby='') {
  path = 'variablefamilies'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get variable families (id)
#' @description This function returns data from ``/v1.0/variablefamilies/{id}``
#' @param id (string): Variable family identificator.
#' @examples
#' get_structuralresources_variable_families_id("VRF_DEMOGRAFICAS")
#' @export
get_structuralresources_variable_families_id <- function(id) {
  path = paste('variablefamilies', id, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get variable families (id) variables
#' @description This function returns data from ``/v1.0/variablefamilies/{id}/variables``
#' @param id (string): Variable family identificator.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_variable_families_id_variables("VRF_DEMOGRAFICAS")
#' @export
get_structuralresources_variable_families_id_variables <- function(id, limit=25, offset=0, query='', orderby='') {
  path = paste('variablefamilies', id, 'variables', sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get variables
#' @description This function returns data from ``/v1.0/variables``
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_variables()
#' @export
get_structuralresources_variables <- function(limit=25, offset=0, query='', orderby='') {
  path = 'variables'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get variables (id)
#' @description This function returns data from ``/v1.0/variables/{id}``
#' @param id (string): Variable identifier.
#' @examples
#' get_structuralresources_variables_id("VR_SEXO")
#' @export
get_structuralresources_variables_id <- function(id) {
  path = paste('variables', id, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get variableelements
#' @description This function returns data from ``/v1.0/variables/{variableID}/variableelements``
#' @param variableid (string) Variable identificator.
#' @param limit (int) Results limit. By default ``limit = 25``.
#' @param offset (int) Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string) Query to filter the results.
#' @param orderby (string) Field by which to sort the results.
#' @examples
#' get_structuralresources_variableelements("VR_SEXO")
#' @export
get_structuralresources_variableelements <- function(variableid, limit=25, offset=0, query='', orderby='') {
  path = paste('variables', variableid, 'variableelements', sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get variableelements resource
#' @description This function returns data from ``/v1.0/variables/{variableID}/variableelements/{resourceID}``
#' @param variableid (string): Resource identificator.
#' @param resourceid (string): Variable identificator.
#' @examples
#' get_structuralresources_variableelements_resource("VR_SEXO", "FEMALE")
#' @export
get_structuralresources_variableelements_resource <- function(variableid, resourceid) {
  path = paste('variables', variableid, 'variableelements', resourceid, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get geoinfo
#' @description This function returns data from
#' ``/v1.0/variables/{variableID}/variableelements/{resourceID}/geoinfo``
#' @param variableid (string): Variable identificator.
#' @param resourceid (string): Resource identificator.
#' @param fields (string): Additional fields that you want to show in the answer.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_geoinfo("VR_TERRITORIO", "MUN_ICOD_VINOS")
#' @export
get_structuralresources_geoinfo <- function(variableid, resourceid, fields='', limit=25, offset=0, query='', orderby='') {
  path = paste('variables', variableid, 'variableelements', resourceid, 'geoinfo', sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(fields=fields, limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

