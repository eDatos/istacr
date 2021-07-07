## get_structuralresources_categorisations()
test_that("Structural resources returns a list", {
  ind <- get_structuralresources_categorisations()
  expect_is(ind, "list")

  ind <- get_structuralresources_categorisations_agency("ISTAC")
  expect_is(ind, "list")

  ind <- get_structuralresources_categorisations_agency_resource("ISTAC", "cat2")
  expect_is(ind, "list")

  ind <- get_structuralresources_categorisations_agency_resource("ISTAC", "cat2")
  expect_is(ind, "list")

  ind <- get_structuralresources_categorisations_agency_resource_version("ISTAC", "cat2", "01.000")
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes(query = "ID EQ 2090", orderBy = "ID ASC")
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes_agency("ISTAC", query = "ID EQ 2090", orderBy = "ID ASC")
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes_agency_resource("ISTAC", "TEMAS_CANARIAS")
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes_agency_resource_version(
       "ISTAC", "TEMAS_CANARIAS", "01.000")
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes_agency_resource_version_categories(
       "ISTAC", "TEMAS_CANARIAS", "01.000",
       limit = 10)
  expect_is(ind, "list")

  ind <- get_structuralresources_category_schemes_agency_resource_version_categories_id(
       "ISTAC", "TEMAS_CANARIAS", "01.000", "060")
  expect_is(ind, "list")

})


test_that("Structural resources - check df", {
  ind <- get_structuralresources_categorisations()
  expect_is(ind$categorisation, "data.frame")

  ind <- get_structuralresources_categorisations_agency('ISTAC')
  expect_is(ind$categorisation, "data.frame")

  ind <-get_structuralresources_categorisations_agency_resource('ISTAC', 'cat2')
  expect_is(ind$categorisation, "data.frame")

  ind <- get_structuralresources_category_schemes_agency_resource("ISTAC", "TEMAS_CANARIAS")
  expect_is(ind$categoryScheme, "data.frame")

  ind <- get_structuralresources_category_schemes_agency_resource_version_categories(
    "ISTAC", "TEMAS_CANARIAS", "01.000",
    limit = 10)
  expect_is(ind$category, "data.frame")
})


