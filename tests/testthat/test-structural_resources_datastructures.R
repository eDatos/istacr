test_that("Structural resources content returns a list", {
  ind <- get_structuralresources_content_constraints()
  expect_is(ind, "list")

  ind <- get_structuralresources_content_constraints_agency("ISTAC")
  expect_is(ind, "list")

  ind <- get_structuralresources_content_constraints_agency_resource("ISTAC", "CL_AREA")
  expect_is(ind, "list")

  ind <- get_structuralresources_data_structures()
  expect_is(ind, "list")

  ind <- get_structuralresources_data_structures_agency("ISTAC")
  expect_is(ind, "list")

  ind <- get_structuralresources_data_structures_agency_resource("ISTAC", "CL_AREA")
  expect_is(ind, "list")

})

test_that("Structural resources content returns a list", {
  ind <- get_structuralresources_data_structures()
  expect_is(ind$dataStructure, "data.frame")

  ind <- get_structuralresources_data_structures_agency("ISTAC")
  expect_is(ind$dataStructure, "data.frame")
})
