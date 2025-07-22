[istacr](../index.md) / [Statistical resources](./statistical-resources.md) / Cubes 

# Statistical resources: Cubes

##  Get datasets
This function allows consulting all existing statistical data cubes.

### Parameters
- lang (string): Language in which you want to get the answer.
- limit (int): Results limit. By default ``limit=25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
- query (string): Metadata query on which the searches can be built.

### Examples
```{code}
get_statisticalresources_datasets(limit=5)
```

## Get datasets (agencyID)
This function allows to consult all the data sets maintained by a certain organization.

### Parameters
- agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
- lang (string): Language in which you want to get the answer.
- limit (int): Results limit. By default ``limit=25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
- query (string): Metadata query on which the searches can be built.

### Examples
```{code}
get_statisticalresources_datasets_agency(agencyid="ISTAC")
```

## Get datasets (agencyID / resourceID)
This function allows to obtain all the versions of a statistical cube with a certain identifier and that also maintains a certain organization.

### Parameters
- agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
- resourceid (string): Resource identifier. A possible value is ``C00010A_000002``.
- lang (string): Language in which you want to get the answer.
- limit (int): Results limit. By default ``limit=25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``.
- query (string): Metadata query on which the searches can be built.

### Examples
```{code}
get_statisticalresources_datasets_agency_resource(
  agencyid="ISTAC", 
  resourceid="C00010A_000002"
)
```

## Get datasets (agencyID / resourceID / version)
This function allows to obtain a certain version of a statistical cube with a certain identifier and that also maintains a certain organization.

### Parameters 
- agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
- resourceid (string): Resource identifier. A possible value is ``C00010A_000002``.
- version (string): Resource version. A possible value is ``001.000``.
- dim (string): Allows filtering the data obtained in the response. A example is ``TIME_PERIOD:2009|2010``.
- fields (string): Allows you to customize the response by excluding fields from it. The possible values are ``-metadata`` and ``-data``.
- lang (string): Language in which you want to get the answer.
- as_dataframe (bool): If True, this function returns a namedtuple with:
  - dataframe: pandas dataframe built from API response.
  - codelists: mapping between codes and representations for each column.

### Examples
```{code}
get_statisticalresources_datasets_agency_resource_version(
  agencyid="ISTAC",
  resourceid="C00010A_000012",
  version="001.000",
  dim="TIME_PERIOD:2009"
)
```