[istacr](../index.md) / [Structural resources](./structural-resources.md) / Concepts 

# Structural resources: Concepts

## Get concept types
This function returns the content from ``/v1.0/conceptTypes``

### Examples
```{code}
get_structuralresources_concept_types()
```

## Get concept schemes
This function returns the content from ``/v1.0/conceptschemes``

### Parameters 
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_concept_schemes()
get_structuralresources_concept_schemes(
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get concept schemes agency
This function returns the content from ``/v1.0/conceptschemes/{agencyID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_concept_schemes_agency("ISTAC")
get_structuralresources_concept_schemes_agency(
  "ESTAT",
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get concept schemes agency resource
This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_concept_schemes_agency_resource(
  agencyid="ISTAC",
  resourceid="CSM_C00010A_SIE"
)
```

## Get concept schemes agency resource version
This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}``

### Parameters 
- agencyid (string) Identifier of the agency that publishes.
- resourceid (string) Resource identifier.
- version (string) Specific version of the resource.

### Examples
```{code}
get_structuralresources_concept_schemes_agency_resource_version(
  agencyid="ISTAC",
  resourceid="CSM_C00010A_SIE",
  version="01.000"
)
```

## Get concept schemes agency resource version concepts
This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.
- fields (string): Additional fields that you want to show in the answer.

### Examples
```{code}
get_structuralresources_concept_schemes_agency_resource_version_concepts(
  agencyid="ISTAC",
  resourceid="CSM_C00010A_SIE",
  version="01.000"
)
```

## Get concept schemes agency resource version concepts (id)
This function returns the content from ``/v1.0/conceptschemes/{agencyID}/{resourceID}/{version}/concepts/{conceptID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.
- conceptid (string): Concept identifier.

### Examples
```{code}
get_structuralresources_concept_schemes_agency_resource_version_concepts_id(
  agencyid="ISTAC",
  resourceid="CSM_C00010A_SIE",
  version="01.000",
  conceptid="ELECTORES"
)
```
