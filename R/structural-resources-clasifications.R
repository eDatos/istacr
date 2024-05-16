#source('R/services.R')

STRUCTURAL_RESOURCES_API = 'structural-resources'

#' @title Get codelist families
#' @description This function returns the list of families of classifications
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param orderby (string): Field by which to sort the results.
#' @param query (string): Query to filter the results.
#' @examples
#' get_structuralresources_codelist_families()
#' @export
get_structuralresources_codelist_families <- function(limit=25, offset=0, orderby='', query='') {
  path = 'codelistfamilies'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, orderBy=orderby, query=query)
  )
  get_content(url)
}

#' @title Get codelist families
#' @description This function allows to obtain a family of classifications in particular.
#' @param id (string): codelist family identificator
#' @examples
#' get_structuralresources_codelist_families_id('CODELIST_ID')
#' @export
get_structuralresources_codelist_families_id <- function(id) {
  path = paste('codelistfamilies', id, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}

#' @title Get codelists
#' @description This function allows to obtain the list of classifications.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists()
#' @export
get_structuralresources_codelists <- function(limit=25, offset=0, query='', orderby='') {
  path = 'codelists'
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get codelists agency
#' @description This function allows obtaining the list of all the classifications maintained by a certain organization.
#' @param agencyid (string): Agency identificator.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists_agency("ISTAC")
#' get_structuralresources_codelists_agency("ESTAT")
#' @export
get_structuralresources_codelists_agency <- function(agencyid, limit=25, offset=0, query='', orderby='') {
  path = paste('codelists', agencyid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get codelists agency resource
#' @description This function allows to obtain all the versions of a classification with a certain
#' identifier and that is also kept by a certain organization.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results.
#' @param orderby (string): Field by which to sort the results.
#' @examples
#' get_structuralresources_codelists_agency_resource("ISTAC", "CL_AREA_ES")
#' @export
get_structuralresources_codelists_agency_resource <- function(agencyid, resourceid, limit=25, offset=0, query='', orderby='') {
  path = paste('codelists', agencyid, resourceid, sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

#' @title Get codelists agency resource version
#' @description This function allows you to consult a particular version of a classification.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param version (string): Specific resource version.
#' @examples
#' get_structuralresources_codelists_agency_resource_version(
#' "ISTAC",
#' "CL_AREA_ES",
#' "01.000"
#' )
#' @export
get_structuralresources_codelists_agency_resource_version <- function(agencyid, resourceid, version) {
  path = paste('codelists', agencyid, resourceid, version, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}


#' @title Get codelists agency resource version restrictions
#' @description This function allows you to consult any restrictions for a specific code of a version of a classification.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param version (string): Specific resource version.
#' @param codeid (string): Code identificator.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_restrictions(
#' "ISTAC",
#' "CL_AREA_ES",
#' "~latest"
#' )
#' @export
get_structuralresources_codelists_agency_resource_version_restrictions <- function(agencyid, resourceid, version) {
  path = paste('codelists', agencyid, resourceid, version, 'restrictions', sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)$restriction
}

#' @title Get codelists agency resource version recode
#' @description This function allows to see changes between two classifications.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param version (string): Specific resource version.
#' @param referenceagencyid (string): Reference agency identificator.
#' @param referenceresourceid (string): Reference resource identificator.
#' @param referenceversion (string): Reference specific resource version.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_recode(
#' "ISTAC",
#' "CL_AREA_ES",
#' "01.001",
#' "ISTAC",
#' "CL_AREA_ES_RELATIVA",
#' "~latest"
#' )
#' @export
get_structuralresources_codelists_agency_resource_version_recode <- function(agencyid, resourceid, version, referenceagencyid, referenceresourceid, referenceversion) {
  path = paste('codelists', agencyid, resourceid, paste(version, ':recode', sep = ''), sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path,
                             query_list = list(referenceAgencyID=referenceagencyid, referenceResourceID=referenceresourceid, referenceVersion=referenceversion))
  get_content(url)$code
}

#' @title Get codelists agency resource version codes
#' @description This function allows to consult the codes of a version of a classification. Note that
#' if wildcards are used as ``~all`` or one of the ``limit``, ``offset``, ``query`` or
#' ``orderBy`` parameters, the list will be automatically paginated.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param version (string): Specific resource version.
#' @param limit (int): Results limit. By default ``limit = 25``.
#' @param offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
#' @param query (string): Query to filter the results. orderby (string): Field by which to sort the results.
#' @param openness (string): Opening established for viewing.
#' @param order (string): Order established for visualization.
#' @param orderby (string): Order established for data.
#' @param fields (string): Additional fields that you want to show in the answer.
#' @param lang (string): Language in which you want to get the answer.
#' @param as_dataframe (bool): If True, this function returns a pandas dataframe built from API response.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_codes(
#' "ISTAC",
#' "CL_AREA_ES",
#' "01.000"
#' )
#' @export
get_structuralresources_codelists_agency_resource_version_codes <- function(agencyid, resourceid, version, limit=1000, offset=0, query='', orderby='', openness='', order='', fields='', lang='es', as_dataframe=T) {
  path = paste('codelists', agencyid, resourceid, version, 'codes', sep = '/')
  url = build_entrypoint_url(
    STRUCTURAL_RESOURCES_API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby, openness=openness, order=order, fields=fields)
  )
  api_response = get_content(url)

  if(as_dataframe) {
    api_response_list = list('1' = api_response)
    while ("nextLink" %in% names(api_response)) {
      api_response = get_content(api_response[['nextLink']])
      list_index = str(length(api_response_list) + 1)
      api_response_list = append(api_response_list, list(list_index = api_response))
    }
    return(build_resolved_codelists_api_response(api_response_list, lang))
  } else {
    return(api_response)
  }
}

#' @title Get codelists agency resource version codes (codeID)
#' @description This function allows to consult a specific code of a version of a classification.
#' @param agencyid (string): Agency identificator.
#' @param resourceid (string): Resource identificator.
#' @param version (string): Specific resource version.
#' @param codeid (string): Code identificator.
#' @examples
#' get_structuralresources_codelists_agency_resource_version_codes_codeid(
#' "ISTAC", "CL_AREA_ES", "01.000", "ES706A01")
#' @export
get_structuralresources_codelists_agency_resource_version_codes_codeid <- function(agencyid, resourceid, version, codeid) {
  path = paste('codelists', agencyid, resourceid, version, 'codes', codeid, sep = '/')
  url = build_entrypoint_url(STRUCTURAL_RESOURCES_API, path)
  get_content(url)
}
