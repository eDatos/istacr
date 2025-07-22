[istacr](../index.md) / [Statistical resources](./statistical-resources.md) / Queries 

# Statistical resources: Queries

## Get queries
This function allows consulting all existing statistical queries.

### Parameters
- lang (string): Language in which you want to get the answer.
- limit (int): Results limit. By default ``limit=25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``,
- query (string): Metadata query on which the searches can be built.

### Examples
```{code}
get_statisticalresources_queries(limit=5)
```

## Get queries (agencyID)
This function allows to consult all the queries maintained by a certain organization.

### Parameters
- agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
- lang (string): Language in which you want to get the answer.
- limit (int): Results limit. By default ``limit=25``.
- offset (int): Displacement. Result from which it is returned. By default ``offset=0``.
- orderby (string): Order. Possible values are ``ID ASC`` or ``ID DESC``,
- query (string): Metadata query on which the searches can be built.

### Examples
```{code}
get_statisticalresources_queries_agency(agencyid="ISTAC", limit=5)
```

## Get queries (agencyID / resourceID)
This function allows to obtain final data of a statistical query with a certain identifier and that also maintains a certain organization.

### Parameters
- agencyid (string): Identifier of the maintainer organization of the resource. A possible value is ``ISTAC``.
- resourceid (string): Resource identifier. A possible value is ``C00005A_000004``.
- fields (string): Allows you to customize the response by excluding fields from it.
  - The possible values are ``-metadata`` and ``-data``.
- lang (string): Language in which you want to get the answer.
- as_dataframe (bool): If True, this function returns a namedtuple with:
  - dataframe: pandas dataframe built from API response.
  - codelists: mapping between codes and representations for each column.

### Examples
```{code}
get_statisticalresources_queries_agency_resource(
  agencyid="ISTAC",
  resourceid="C00005A_000004"
)
```