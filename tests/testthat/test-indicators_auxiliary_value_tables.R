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
