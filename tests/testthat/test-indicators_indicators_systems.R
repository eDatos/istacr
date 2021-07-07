## get_indicators_systems
test_that("get_indicators_systems() returns a list", {
  ind <- get_indicators_systems()
  expect_is(ind, "list")
})

test_that("get_indicators_systems() items slot returns a data.frame", {
  ind <- get_indicators_systems()
  expect_is(ind$items, "data.frame")
})


test_that("get_indicators_systems() has more than one language", {
  ind <- get_indicators_systems()
  expect_gte(length(names(ind$items$title)[!names(ind$items$title) %in% "__default__"]), 2)
})

test_that("get_indicators_systems() limit is 25", {
  ind <- get_indicators_systems()
  expect_equal(ind$limit, 25)
})



## get_indicators_systems_code()
test_that("Find error when no indicators systems code is provided", {
  expect_error(get_indicators_systems_code())
})


test_that("get_indicators_systems_code() elements slot returns a data.frame", {
  ind <- get_indicators_systems_code("C00075H")
  expect_is(ind$elements, "data.frame")
})


## get_indicators_systems_code_instances()
test_that("get_indicators_systems_code_instances fails when no indicators systems code is provided", {
  expect_error(get_indicators_systems_code_instances())
})


## get_indicators_systems_code_instances_code()
test_that("get_indicators_systems_code_instances_code fails when no indicators systems code is provided", {
  expect_error(get_indicators_systems_code_instances_code())
})


## get_indicators_systems_code_instances_code_data()
test_that("get_indicators_systems_code_instances_code_data fails when no indicators systems code is provided", {
  expect_error(get_indicators_systems_code_instances_code_data())
})


test_that("get_indicators_systems_code_instances_code_data() attribute slot returns a data.frame", {
  ind <- get_indicators_systems_code_instances_code_data("C00075H", "21af0477-d63b-493b-ad02-4ab181547223")
  expect_is(ind$attribute, "data.frame")
})
