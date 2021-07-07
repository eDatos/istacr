## get_structuralresources_categorisations()
test_that("Structural resources classification returns a list", {
  ind <- get_structuralresources_codelist_families()
  expect_is(ind, "list")

  ind <- get_structuralresources_codelist_families_id()
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists()
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists_agency("ISTAC")
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists_agency_resource("ISTAC", "CL_AREA_ES")
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists_agency_resource_version("ISTAC", "CL_AREA_ES", "01.000")
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists_agency_resource_version_codes("ISTAC", "CL_AREA_ES", "01.000")
  expect_is(ind, "list")

  ind <- get_structuralresources_codelists_agency_resource_version_codes_codeid(
       "ISTAC", "CL_AREA_ES", "01.000", "ES706A01" )
  expect_is(ind, "list")
})


test_that("Structural resources classification - check df", {
  ind <- get_structuralresources_codelists()
  expect_is(ind$codelist, "data.frame")

  ind <- get_structuralresources_codelists_agency("ISTAC")
  expect_is(ind$codelist, "data.frame")

  ind <- get_structuralresources_codelists_agency_resource_version_codes("ISTAC", "CL_AREA_ES", "01.000")
  expect_is(ind$code, "data.frame")
})


