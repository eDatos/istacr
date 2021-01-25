
<!-- README.md is generated from README.Rmd. Please edit that file -->

# istacr

<!-- badges: start -->

[![R build
status](https://github.com/jlopezper/istacr/workflows/R-CMD-check/badge.svg)](https://github.com/jlopezper/istacr/actions)
[![Codecov test
coverage](https://codecov.io/gh/jlopezper/istacr/branch/master/graph/badge.svg)](https://codecov.io/gh/jlopezper/istacr?branch=master)
<!-- badges: end -->

The goal of `istacr` is to provide a wrapper to the [ISTAC api
catalog](https://www3.gobiernodecanarias.org/aplicaciones/appsistac/api),
allowing the user to obtain the open data from R.

## Installation

You can install the released version of istacr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("istacr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("eDatos/istacr")
```

## How to use this package

The package offers different functions depending on the resource you
want to access. There’re three main resources:

  - Indicators
  - Statistical resources (cubes)
  - Structural resources

## Examples

### Indicators

Get a list of all indicators:

``` r
library(istacr)
tst <- get_indicators()
str(tst, max.level = 1)
#> List of 8
#>  $ kind    : chr "indicators#indicators"
#>  $ limit   : int 25
#>  $ offset  : int 0
#>  $ total   : int 211
#>  $ selfLink: chr "https://datos.canarias.es/api/estadisticas/indicators/v1.0/indicators?order&fields&representation&limit=25&offset=0"
#>  $ nextLink: chr "https://datos.canarias.es/api/estadisticas/indicators/v1.0/indicators?order&fields&representation&limit=25&offset=25"
#>  $ lastLink: chr "https://datos.canarias.es/api/estadisticas/indicators/v1.0/indicators?order&fields&representation&limit=25&offset=200"
#>  $ items   :'data.frame':    25 obs. of  12 variables:
```

Get information of a specific indicator:

``` r
tst <- get_indicators_code("TURISTAS")
str(tst, max.level = 1)
#> List of 17
#>  $ id                : chr "TURISTAS"
#>  $ kind              : chr "indicators#indicator"
#>  $ selfLink          : chr "https://datos.canarias.es/api/estadisticas/indicators/v1.0/indicators/TURISTAS"
#>  $ parentLink        :List of 2
#>  $ code              : chr "TURISTAS"
#>  $ version           : chr "1.32"
#>  $ title             :List of 3
#>  $ acronym           :List of 3
#>  $ subjectCode       : chr "082"
#>  $ systemSurveyLinks :'data.frame':  1 obs. of  2 variables:
#>  $ conceptDescription:List of 3
#>  $ notes             :List of 3
#>  $ dimension         :List of 3
#>  $ attribute         :List of 1
#>  $ childLink         :List of 2
#>  $ subjectTitle      :List of 2
#>  $ decimalPlaces     : int 0
```

Or about geographical granularities:

``` r
# Get granularities
tst <- get_indicators_geographic_granularities()
tst$items
#>             code       title.en              title.es     title.__default__
#> 1      COUNTRIES      Countries                Países                Países
#> 2        REGIONS        Regions Comunidades autónomas Comunidades autónomas
#> 3      PROVINCES      Provinces            Provincias            Provincias
#> 4 MUNICIPALITIES Municipalities            Municipios            Municipios
#> 5        ISLANDS        Islands                 Islas                 Islas
#> 6       COUNTIES       Counties              Comarcas              Comarcas

# Get information about a specific granularity
get_indicators_geographical_values('ISLANDS')
#> $kind
#> [1] "indicators#geographicalValues"
#> 
#> $total
#> [1] 7
#> 
#> $selfLink
#> [1] "https://datos.canarias.es/api/estadisticas/indicators/v1.0/geographicalValues?geographicalGranularityCode=ISLANDS"
#> 
#> $items
#>    code      title.es      title.en title.__default__ granularityCode latitude
#> 1 ES708     Lanzarote     Lanzarote         Lanzarote         ISLANDS 28.95802
#> 2 ES704 Fuerteventura Fuerteventura     Fuerteventura         ISLANDS 28.49863
#> 3 ES705  Gran Canaria  Gran Canaria      Gran Canaria         ISLANDS 28.10786
#> 4 ES709      Tenerife      Tenerife          Tenerife         ISLANDS 28.46613
#> 5 ES706     La Gomera     La Gomera         La Gomera         ISLANDS 28.09131
#> 6 ES707      La Palma      La Palma          La Palma         ISLANDS 28.68142
#> 7 ES703     El Hierro     El Hierro         El Hierro         ISLANDS 27.80738
#>   longitude
#> 1 -13.56318
#> 2 -13.86055
#> 3 -15.41998
#> 4 -16.24707
#> 5 -17.11233
#> 6 -17.76565
#> 7 -17.91557
```

### Statistical resources

Get all available cubes:

``` r
tst <- get_datasets()
str(tst, max.level = 1)
#> List of 8
#>  $ dataset :'data.frame':    25 obs. of  5 variables:
#>  $ kind    : chr "statisticalResources#datasets"
#>  $ total   : int 357
#>  $ limit   : int 25
#>  $ offset  : int 0
#>  $ selfLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets?query&orderBy&limit=25&offset=0"
#>  $ nextLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets?query&orderBy&limit=25&offset=25"
#>  $ lastLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets?query&orderBy&limit=25&offset=350"
```

Only those from a specific maintainer:

``` r
tst <- get_datasets_agency('ISTAC')
str(tst, max.level = 1)
#> List of 8
#>  $ dataset :'data.frame':    25 obs. of  5 variables:
#>  $ kind    : chr "statisticalResources#datasets"
#>  $ total   : int 357
#>  $ limit   : int 25
#>  $ offset  : int 0
#>  $ selfLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets/ISTAC?query&orderBy&limit=25&offset=0"
#>  $ nextLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets/ISTAC?query&orderBy&limit=25&offset=25"
#>  $ lastLink: chr "https://datos.canarias.es/api/estadisticas/statistical-resources/v1.0/datasets/ISTAC?query&orderBy&limit=25&offset=350"
```

### Structural resources

``` r
tst <- istacr::get_structuralresources_codelists()
tst$codelist$id
#>  [1] "CL_ABANDONO_CULTIVO"      "CL_ABANDONO_CULTIVO"     
#>  [3] "CL_ABANDONO_CULTIVO"      "CL_AEROPUERTOS"          
#>  [5] "CL_AEROPUERTOS"           "CL_AEROPUERTOS"          
#>  [7] "CL_AEROPUERTOS"           "CL_AGE"                  
#>  [9] "CL_AGE"                   "CL_AGE"                  
#> [11] "CL_AGE"                   "CL_AGE"                  
#> [13] "CL_AGRIPROD"              "CL_AGRIPROD"             
#> [15] "CL_ANTIGUEDAD"            "CL_AREA_ES"              
#> [17] "CL_AREA_ES"               "CL_AREA_ES"              
#> [19] "CL_AREA_ES"               "CL_AREA_ES"              
#> [21] "CL_AREA_ES70_COMARCAS"    "CL_AREA_ES70_DS_19870610"
#> [23] "CL_AREA_ES70_DS_19910526" "CL_AREA_ES70_DS_19930606"
#> [25] "CL_AREA_ES70_DS_19940612"
```

``` r
tst <- get_structuralresources_codelists_agency_resource('ISTAC', 'CL_ABANDONO_CULTIVO')
tst$codelist
#>                    id
#> 1 CL_ABANDONO_CULTIVO
#> 2 CL_ABANDONO_CULTIVO
#> 3 CL_ABANDONO_CULTIVO
#>                                                                               urn
#> 1 urn:sdmx:org.sdmx.infomodel.codelist.Codelist=ISTAC:CL_ABANDONO_CULTIVO(01.000)
#> 2 urn:sdmx:org.sdmx.infomodel.codelist.Codelist=ISTAC:CL_ABANDONO_CULTIVO(01.002)
#> 3 urn:sdmx:org.sdmx.infomodel.codelist.Codelist=ISTAC:CL_ABANDONO_CULTIVO(01.001)
#>                  selfLink.kind
#> 1 structuralResources#codelist
#> 2 structuralResources#codelist
#> 3 structuralResources#codelist
#>                                                                                                     selfLink.href
#> 1 https://datos.canarias.es/api/estadisticas/structural-resources/v1.0/codelists/ISTAC/CL_ABANDONO_CULTIVO/01.000
#> 2 https://datos.canarias.es/api/estadisticas/structural-resources/v1.0/codelists/ISTAC/CL_ABANDONO_CULTIVO/01.002
#> 3 https://datos.canarias.es/api/estadisticas/structural-resources/v1.0/codelists/ISTAC/CL_ABANDONO_CULTIVO/01.001
#>                                       text                         kind
#> 1 Clasificación de Abandono de Cultivo, es structuralResources#codelist
#> 2 Clasificación de Abandono de Cultivo, es structuralResources#codelist
#> 3 Clasificación de Abandono de Cultivo, es structuralResources#codelist
```

## Further information

Please find the latest documentation on
[CRAN](https://cran.r-project.org/web/packages/istacr/istacr.pdf). In
case you want to report a bug, please open an
[issue](https://github.com/eDatos/istacr/issues).
