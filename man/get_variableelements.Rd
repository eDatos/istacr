% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/structural_resources_variables.R
\name{get_variableelements}
\alias{get_variableelements}
\title{Get variableelements}
\usage{
get_variableelements(variableID, limit = 25, offset = 0,
  query = NULL, orderBy = NULL)
}
\arguments{
\item{variableID}{(string) Variable identificator.}

\item{limit}{(int) Results limit. By default \code{limit = 25}.}

\item{offset}{(int) Displacement. Result from which it is returned.  By default \code{offset = 0}.}

\item{query}{(string) Query to filter the results.}

\item{orderBy}{(string) Field by which to sort the results.}
}
\description{
This function returns data from /v1.0/variables/{variableID}/variableelements
}
\examples{
get_variableelements("VR_SEXO")
}
