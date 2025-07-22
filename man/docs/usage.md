# istacr

*istacr* is a R package for obtaining open data from [Instituto Canario de Estadística (ISTAC)](http://www.gobiernodecanarias.org/istac/). It provides a wrapper to the [open API catalog](https://www3.gobiernodecanarias.org/aplicaciones/appsistac/api).

## Usage

The package is divided into several modules depending on the resource you want to retrieve:
 
 - [Indicators](./src/indicators.md): Systems, instances, granularities and subjects of indicators.
 - [Statistical resources](./src/statistical-resources.md): Datasets and queries of cubes.
 - [Structural resources](./src/structural-resources.md): Categories, schemes, classifications, families and concepts for normalize statistical resources.

## Base URL

The package allows you to consult data from any eDatos API catalog instance. To change default instance (https://datos.canarias.es/api/estadisticas/), use the *change_api_url* method.

## Package reference

[Package manual (PDF)](../istacr-manual.pdf)
