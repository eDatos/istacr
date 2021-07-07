## get_indicators_geographic_granularities
test_that("get_indicators_geographic_granularities() returns a list", {
  ind <- get_indicators_geographic_granularities()
  expect_is(ind, "list")
})


test_that("get_indicators_geographic_granularities() items slot returns a data.frame", {
  ind <- get_indicators_geographic_granularities()
  expect_is(ind$items, "data.frame")
})


test_that("get_indicators_geographic_granularities() has more than one language", {
  ind <- get_indicators_geographic_granularities()
  expect_gte(length(names(ind$items$title)[!names(ind$items$title) %in% "__default__"]), 2)
})



## get_indicators_geographical_values()
test_that("Find error when no geographicalGranularityCode is provided", {
  expect_error(get_indicators_geographical_values())
})

test_that("Ensure there're at least 17 regions", {
  ind <- get_indicators_geographical_values(geographicalGranularityCode = "REGIONS")
  expect_gte(nrow(ind$items), 17)
})


test_that("Ensure Canarias is among the regions", {
  ind <- get_indicators_geographical_values(geographicalGranularityCode = "REGIONS")
  testthat::expect_true(any(ind$items$title$es == "Canarias"))
})


test_that("Ensure Canarias is among the regions", {
  ind <- get_indicators_geographical_values("REGIONS", subjectCode = "051", systemCode = "C00067A")
  testthat::expect_true(any(ind$items$title$es == "Canarias"))
})


## get_indicators_subjects()
test_that("get_indicators_subjects() returns a list", {
  ind <- get_indicators_subjects()
  expect_is(ind, "list")
})


test_that("get_indicators_subjects() items slot returns a data.frame", {
  ind <- get_indicators_subjects()
  expect_is(ind$items, "data.frame")
})

## get_indicators_time_granularities()
test_that("get_indicators_time_granularities() returns a list", {
  ind <- get_indicators_time_granularities()
  expect_is(ind, "list")
})


test_that("get_indicators_time_granularities() items slot returns a data.frame", {
  ind <- get_indicators_time_granularities()
  expect_is(ind$items, "data.frame")
})


test_that("get_indicators_time_granularities() id contains all the time frequencies", {
  ind <- get_indicators_time_granularities()
  expect_equal(ind$items$code, c("YEARLY", "BIYEARLY", "QUARTERLY", "FOUR_MONTHLY", "MONTHLY",
                                 "WEEKLY", "DAILY", "HOURLY"))
})


test_that("get_indicators_time_granularities() has more than one language", {
  ind <- get_indicators_time_granularities()
  expect_gte(length(names(ind$items$title)[!names(ind$items$title) %in% "__default__"]), 2)
})
