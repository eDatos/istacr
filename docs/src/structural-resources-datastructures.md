[istacr](../index.md) / [Structural resources](./structural-resources.md) / Data structures 

# Structural resources: Data structures

## Get content constraints
This function returns the content from ``/v1.0/contentConstraints``

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_content_constraints()
get_structuralresources_content_constraints(
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get content constraints agency
This function returns the content from ``/v1.0/contentConstraints/{agencyID}``

### Parameters 
- agencyid (string): Identifier of the agency that publishes.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_content_constraints_agency("ISTAC")
```

## Get content constraints agency resource
This function returns the content from ``/v1.0/contentConstraints/{agencyID}/{resourceID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_content_constraints_agency_resource(
  "ISTAC",
  "CSM_C00010A_SIE"
)
```

## Get content constraints agency resource version
This function returns the content from ``/v1.0/contentConstraints/{agencyID}/{resourceID}/{version}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.

### Examples
```{code}
get_structuralresources_content_constraints_agency_resource_version(
  "ISTAC",
  "CSM_C00010A_SIE",
  "01.000"
)
```

## Get content constraints agency resource version regions
This function returns the content from ``/v1.0/contentConstraints/{agencyID}/{resourceID}/{version}/regions/``{regionCode}

### Parameters
- regioncode (string) Region code.
- agencyid (string) Identifier of the agency that publishes.
- resourceid (string) Resource identifier.
- version (string) Specific version of the resource.

### Examples
```{code}
get_structuralresources_content_constraints_agency_resource_version_regions(
  "0001",
  "ISTAC",
  "CSM_C00010A_SIE",
  "01.000"
)
```

## Get data structures
This function returns the content from ``/v1.0/datastructures``

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_data_structures()
get_structuralresources_data_structures(
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get data structures agency
This function returns the content from ``/v1.0/datastructures/{agencyID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_data_structures_agency("ISTAC")
```

## Get data structures agency resource
This function returns the content from ``/v1.0/datastructures/{agencyID}/{resourceID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_data_structures_agency_resource(
  "ISTAC",
  "DSD_C00010A_00001"
)
```

## Get data structures agency resource version
This function returns the content from ``/v1.0/datastructures/{agencyID}/{resourceID}/{version}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.

### Examples
```{code}
get_structuralresources_data_structures_agency_resource_version(
  "ISTAC",
  "DSD_C00010A_00001",
  "01.001"
)
```