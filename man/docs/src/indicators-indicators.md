[istacr](../index.md) / [Indicators](./indicators.md) / Indicators 

# Indicators: Indicators

## Get indicators
This function returns a list of indicators published in the ISTAC-indicators database. An indicator is a measure used to know the intensity of a phenomenon in spacetime. This measure can refer to different spatial or temporal granularities.

### Parameters
- q (string): Metadata query on which the searches can be built using ``id``, ``subjectCode`` or ``geographicValue``.
- order (string): Order. Possible values are: ``update`` and ``id``. Order criteria are ``ASC`` and ``DESC``.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
- fields (string): Use of the answer by adding new fields. Possible values are: ``+metadata``, ``+data`` and ``+observationsMetadata``.
- representation (string): Allows filtering the observations by their value. Its use only makes sense when ``+data`` and/or ``+observationsMetadata`` has been included.

### Examples
```{code} 
get_indicators(
    q='id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
    order="id ASC",
    fields="+data, 
    representation="GEOGRAPHICAL[35003|35005], MEASURE[ABSOLUTE]"
)
```

## Get indicators code
This function returns the metadata that describe the characteristics of a specific indicator, allowing the compression of the measured fact; also through the data request the complete data (for all spacetime) of the indicator is provided.

### Parameters
- indicatorcode (string): an indicator code

### Examples
```{code} 
get_indicators_code("AFILIACIONES")
get_indicators_code("PARO_REGISTRADO")
```


## Get indicators code data
This function returns complete data (for all spacetime) of the indicator. On the other hand, metadata describing the characteristics of a specific indicator are offered through the metadata request, allowing the compression of the measured fact.

### Parameters 
- indicatorcode (string): an indicator code
- representation (string): Allows filtering the observations by their value.
- granularity (string): Allows to filter the observations through the granularities of the same.
- fields (string): Allows you to customize the response by excluding fields. The possible values are: ``-observationsMetadata``.
- as_dataframe (bool): If True, this function returns a namedtuple with:
  - dataframe: pandas dataframe built from API response.
  - codelists: mapping between codes and representations for each column.
 
### Examples
```{code}
get_indicators_code_data("AFILIACIONES")
```
