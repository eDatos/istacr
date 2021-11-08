API = 'structural-resources'

get_structuralresources_variable_families <- function(limit=25, offset=0, query='', orderby='') {
  path = 'variablefamilies'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_variable_families_id <- function(id) {
  path = paste('variablefamilies', id, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_variable_families_id_variables <- function(id, limit=25, offset=0, query='', orderby='') {
  path = paste('variablefamilies', id, 'variables', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_variables <- function(limit=25, offset=0, query='', orderby='') {
  path = 'variables'
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_variables_id <- function(id) {
  path = paste('variables', id, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_variableelements <- function(variableid, limit=25, offset=0, query='', orderby='') {
  path = paste('variables', variableid, 'variableelements', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

get_structuralresources_variableelements_resource <- function(variableid, resourceid) {
  path = paste('variables', variableid, 'variableelements', resourceid, sep = '/')
  url = build_entrypoint_url(API, path)
  get_content(url)
}

get_structuralresources_geoinfo <- function(variableid, resourceid, fields='', limit=25, offset=0, query='', orderby='') {
  path = paste('variables', variableid, 'variableelements', resourceid, 'geoinfo', sep = '/')
  url = build_entrypoint_url(
    API, path, query_list = list(fields=fields, limit=limit, offset=offset, query=query, orderBy=orderby)
  )
  get_content(url)
}

