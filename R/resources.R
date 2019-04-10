# Instituto Canario de Estadística (ISTAC)

# Build API URL
get_url <- function(api, path, resource = NULL) {
  url_root <- paste0("https://www3.gobiernodecanarias.org/istac/api/", api, "/v1.0/")

  if (is.null(resource)) {
    url <- paste0(url_root, path)
  } else {
    url <- paste0(url_root, path, "/", resource)
  }

  return(url)
}

# Example: parse_param("GEOGRAPHICAL[MUNICIPALITIES]")
parse_param <- function(param) {
  param <- trimws(param) # Remove white spaces
  param <- gsub("[[]", "%5B", param) # Replace [ for %5B
  param <- gsub("[]]", "%5D", param) # Replace ] for %5D
  param <- gsub("[,]", "%2C", param) # Replace , for %2C
  param <- gsub("[|]", "%7C", param) # Replace | for %7C
  param <- gsub("[+]", "%2B", param) # Replace + for %2B
  param <- gsub("\"", "%22", param) # Replace \" for %22
  param <- gsub(" ", "%20", param) # Replace space for %20
  param <- gsub("[:]", "%3A", param) # Replace : for %3A

  return(param)
}
