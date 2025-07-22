[istacr](../index.md) / [Structural resources](./structural-resources.md) / Variables

# Structural resources: Variables

## Get variable families
This function returns data from ``/v1.0/variablefamilies``

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_variable_families()
```

## Get variable families (id)
This function returns data from ``/v1.0/variablefamilies/{id}``

### Parameters
- id (string): Variable family identificator.

### Examples
```{code}
get_structuralresources_variable_families_id("VRF_DEMOGRAFICAS")
```

## Get variable families (id) variables
This function returns data from ``/v1.0/variablefamilies/{id}/variables``

### Parameters
- id (string): Variable family identificator.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_variable_families_id_variables("VRF_DEMOGRAFICAS")
```

##  Get variables
This function returns data from ``/v1.0/variables``

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_variables()
```

##  Get variables (id)
This function returns data from ``/v1.0/variables/{id}``

### Parameters
- id (string): Variable identifier.

### Examples
```{code}
get_structuralresources_variables_id("VR_SEXO")
```

## Get variableelements
This function returns data from ``/v1.0/variables/{variableID}/variableelements``

### Parameters
- variableid (string) Variable identificator.
- limit (int) Results limit. By default ``limit = 25``.
- offset (int) Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string) Query to filter the results.
- orderby (string) Field by which to sort the results.

### Examples
```{code}
get_structuralresources_variableelements("VR_SEXO")
```

## Get variableelements resource
This function returns data from ``/v1.0/variables/{variableID}/variableelements/{resourceID}``

### Parameters
- variableid (string): Resource identificator.
- resourceid (string): Variable identificator.

### Examples
```{code}
get_structuralresources_variableelements_resource("VR_SEXO", "FEMALE")
```

## Get geoinfo
This function returns data from ``/v1.0/variables/{variableID}/variableelements/{resourceID}/geoinfo``
### Parameters
- variableid (string): Variable identificator.
- resourceid (string): Resource identificator.
- fields (string): Additional fields that you want to show in the answer.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_geoinfo("VR_TERRITORIO", "MUN_ICOD_VINOS")
```
