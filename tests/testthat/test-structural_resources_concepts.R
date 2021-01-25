## get_structuralresources_categorisations()
test_that("Structural resources concet returns a list", {
  ind <- get_structuralresources_concept_types()
  expect_is(ind, "list")

  ind <- get_structuralresources_concept_schemes()
  expect_is(ind, "list")

  ind <- get_structuralresources_concept_schemes_agency("ISTAC")
  expect_is(ind, "list")

  ind <- get_structuralresources_concept_schemes_agency_resource(
         agencyID = "ISTAC", resourceID = "CL_AREA_ES")
  expect_is(ind, "list")

})


test_that("Structural resources classification - check df", {
  ind <- get_structuralresources_concept_types()
  expect_is(ind$conceptType, "data.frame")

  ind <- get_structuralresources_concept_schemes()
  expect_is(ind$conceptScheme, "data.frame")

  ind <- get_structuralresources_concept_schemes_agency("ISTAC")
  expect_is(ind$conceptScheme, "data.frame")
})


