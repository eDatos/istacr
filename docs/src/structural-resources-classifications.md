[istacr](../index.md) / [Structural resources](./structural-resources.md) / Classifications

# Structural resources: Classifications

## Get codelist families
This function returns the list of families of classifications

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- orderby (string): Field by which to sort the results.
- query (string): Query to filter the results.

### Examples
```{code}
get_structuralresources_codelist_families()
```

## Get codelist families
This function allows to obtain a family of classifications in particular.

### Parameters
- id (string): codelist family identificator

### Examples
```{code}
get_structuralresources_codelist_families_id('CODELIST_ID')
```

## Get codelists
This function allows to obtain the list of classifications.
### Parameters 
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_codelists()
```

## Get codelists agency
This function allows obtaining the list of all the classifications maintained by a certain organization.

### Parameters 
- agencyid (string): Agency identificator.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_codelists_agency("ISTAC")
get_structuralresources_codelists_agency("ESTAT")
```

## Get codelists agency resource
This function allows to obtain all the versions of a classification with a certain identifier and that is also kept by a certain organization.

### Parameters
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_codelists_agency_resource("ISTAC", "CL_AREA_ES")
```

## Get codelists agency resource version
This function allows you to consult a particular version of a classification.

### Parameters
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- version (string): Specific resource version.

### Examples
```{code}
get_structuralresources_codelists_agency_resource_version(
  "ISTAC",
  "CL_AREA_ES",
  "01.000"
)
```

## Get codelists agency resource version restrictions
This function allows you to consult any restrictions for a specific code of a version of a classification.

### Parameters
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- version (string): Specific resource version.
- codeid (string): Code identificator.

### Examples
```{code}
get_structuralresources_codelists_agency_resource_version_restrictions(
  "ISTAC",
  "CL_AREA_ES",
  "~latest"
)
```
## Get codelists agency resource version recode

This function allows to see changes between two classifications.

### Parameters 
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- version (string): Specific resource version.
- codeid (string): Code identificator.
- referenceagencyid (string): Reference agency identificator.
- referenceresourceid (string): Reference resource identificator.
- referenceversion (string): Reference specific resource version.

### Examples
```{code}
get_structuralresources_codelists_agency_resource_version_recode(
  "ISTAC",
  "CL_AREA_ES",
  "01.001",
  "ISTAC",
  "CL_AREA_ES_RELATIVA",
  "~latest"
)
```

## Get codelists agency resource version codes
This function allows to consult the codes of a version of a classification. Note that if wildcards are used as ``~all`` or one of the ``limit``, ``offset``, ``query`` or ``orderBy`` parameters, the list will be automatically paginated.
### Parameters 
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- version (string): Specific resource version.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results. orderby (string): Field by which to sort the results.
- openness (string): Opening established for viewing.
- order (string): Order established for visualization.
- orderby (string): Order established for data.
- fields (string): Additional fields that you want to show in the answer.
- lang (string): Language in which you want to get the answer.
- as_dataframe (bool): If True, this function returns a pandas dataframe built from API response.

### Examples
```{code}
get_structuralresources_codelists_agency_resource_version_codes(
  "ISTAC",
  "CL_AREA_ES",
  "01.000"
)
```

## Get codelists agency resource version codes (codeID)
This function allows to consult a specific code of a version of a classification.

### Parameters 
- agencyid (string): Agency identificator.
- resourceid (string): Resource identificator.
- version (string): Specific resource version.
- codeid (string): Code identificator.

### Examples
```{code}
get_structuralresources_codelists_agency_resource_version_codes_codeid(
  "ISTAC", 
  "CL_AREA_ES", 
  "01.000", 
  "ES706A01"
)
```
