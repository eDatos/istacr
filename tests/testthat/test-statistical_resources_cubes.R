## get_datasets_agency()
test_that("get_datasets_agency(agencyID = 'ISTAC') returns a list", {
  ind <- get_datasets_agency(agencyID = "ISTAC")
  expect_is(ind, "list")
})

test_that("get_datasets_agency(agencyID = 'ISTAC') items slot returns a data.frame", {
  ind <- get_datasets_agency(agencyID = 'ISTAC')
  expect_is(ind$dataset, "data.frame")
})


test_that("get_datasets_agency() returns an error", {
  expect_error(get_datasets_agency())
})


test_that("get_datasets_agency(agencyID = 'ISTAC') are 25", {
  ind <- get_datasets_agency(agencyID = 'ISTAC')
  expect_gte(nrow(ind$dataset), 25)
})


## get_datasets_agency_resource()
test_that("get_datasets_agency_resource() returns an error", {
  expect_error(get_datasets_agency_resource())
})

test_that("get_datasets_agency_resource(agencyID = 'ISTAC', resourceID = 'C00010A_000002') returns a list", {
  ind <- get_datasets_agency_resource(agencyID = 'ISTAC', resourceID = 'C00010A_000002')
  expect_is(ind, "list")
})

test_that("get_datasets_agency_resource(agencyID = 'ISTAC', resourceID = 'C00010A_000002') items slot returns a data.frame", {
  ind <- get_datasets_agency_resource(agencyID = 'ISTAC', resourceID = 'C00010A_000002')
  expect_is(ind$dataset, "data.frame")
})


## get_datasets_agency_resource_version()
test_that("get_datasets_agency_resource_version() returns an error", {
  expect_error(get_datasets_agency_resource_version())
})
