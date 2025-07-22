[istacr](../index.md) / [Indicators](./indicators.md) / Geographic 

# Indicators: Geographic

## Get geographic granularities
This function returns a list of geographic granularities treated in the ISTAC-indicators database. For example provincial, insular or municipal granularity.

### Examples 
```{code} 
get_indicators_geographic_granularities()
```

## Get geographical values
This function returns values of a geographical granularity that in turn are part of a specific theme or system of indicators.

### Parameters
- geographicalgranularitycode (string): geographical granularity code
- subjectcode (string): subject code
- systemcode (string): system code

### Examples
```{code} 
get_indicators_geographical_values(
    "REGIONS",
    subjectcode="051",
    systemcode="C00067A"
)
```

## Get subjects
This function returns all subjects which the ISTAC classifies its statistical operations

### Examples
```{code}
get_indicators_subjects()
```

## Get time granularities
This function returns a list of temporary granularity treated in the ISTAC data

### Examples
```{code}
get_indicators_time_granularities()
```