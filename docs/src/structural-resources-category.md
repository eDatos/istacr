[istacr](../index.md) / [Structural resources](./structural-resources.md) / Category

# Structural resources: Category

## Get categorisations
This function returns the content from ``/v1.0/categorisations``

### Paremeters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_categorisations()
get_structuralresources_categorisations(
  query="ID EQ 2090",
  orderby="ID ASC"
)
```
## Get categorisations agency
This function returns the content from ``/v1.0/categorisations/{agencyID}``

### Parameters 
- agencyid (string): Identifier of the agency that publishes.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_categorisations_agency("ISTAC")
```

## Get categorisations agency resource
This function returns the content from ``/v1.0/categorisations/{agencyID}/{resourceID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_categorisations_agency_resource("ISTAC", "cat2")
```

## Get categorisations agency resource version
This function returns the content from ``/v1.0/categorisations/{agencyID}/{resourceID}/{version}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.

### Examples
```{code}
get_structuralresources_categorisations_agency_resource_version(
  "ISTAC",
  "cat2",
  "01.000"
)
```

## Get category schemes
This function returns the content from ``/v1.0/categoryschemes``

### Parameters
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_category_schemes()
get_structuralresources_category_schemes(
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get category schemes agency
This function returns the content from ``/v1.0/categoryschemes/{agencyID}``

### Parameters 
- agencyid (string): Identifier of the agency that publishes.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_category_schemes_agency(
  "ISTAC",
  query="ID EQ 2090",
  orderby="ID ASC"
)
```

## Get category schemes agency resource
This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}``

### Parameters
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned.  By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_category_schemes_agency_resource(
  "ISTAC",
  "TEMAS_CANARIAS"
)
```

## Get category schemes agency resource version
This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}``
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.

### Examples
```{code}
get_structuralresources_category_schemes_agency_resource_version(
  "ISTAC",
  "TEMAS_CANARIAS",
  "01.000"
)
```

## Get category schemes agency resource version categories
This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories``

### Parameters 
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.
- limit (int): Results limit. By default ``limit = 25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset = 0``.
- query (string): Query to filter the results.
- orderby (string): Field by which to sort the results.

### Examples
```{code}
get_structuralresources_category_schemes_agency_resource_version_categories(
  "ISTAC",
  "TEMAS_CANARIAS",
  "01.000"
)
```

## Get category schemes agency resource version categories (id)
This function returns the content from ``/v1.0/categoryschemes/{agencyID}/{resourceID}/{version}/categories/{categoryID}``

### Parameters 
- agencyid (string): Identifier of the agency that publishes.
- resourceid (string): Resource identifier.
- version (string): Specific version of the resource.
- categoryid (string): category identifier.

### Examples
```{code}
get_structuralresources_category_schemes_agency_resource_version_categories_id(
  "ISTAC",
  "TEMAS_CANARIAS",
  "01.000",
  "060"
)
get_structuralresources_category_schemes_agency_resource_version_categories_id(
  "ISTAC",
  "TEMAS_CANARIAS",
  "01.000",
  "060.060_010.060_010_010"
)
```