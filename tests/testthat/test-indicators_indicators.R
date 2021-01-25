## get_indicators()
test_that("get_indicators() returns a list", {
  ind <- get_indicators()
  expect_is(ind, "list")
})


test_that("get_indicators() items slot returns a data.frame", {
  ind <- get_indicators()
  expect_is(ind$items, "data.frame")
})

test_that("get_indicators() has more than one language", {
  ind <- get_indicators()
  expect_gte(length(names(ind$items$title)[!names(ind$items$title) %in% "__default__"]), 2)
})



test_that("get_indicators() has kind indicator", {
  ind <- get_indicators(
    q = 'id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
    order = "id ASC", fields = "+data", representation =
      "GEOGRAPHICAL[35003|35005],MEASURE[ABSOLUTE]"
  )
  expect_true(all(ind$kind == "indicators#indicators"))
})


test_that("get_indicators() offset is correctly set", {
  ind <- get_indicators(
    q = 'id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
    order = "id ASC",
    fields = "+data",
    representation = "GEOGRAPHICAL[35003|35005],MEASURE[ABSOLUTE]"
  )
  expect_equal(grep("offset=0", x = ind$selfLink), 1)


  ind <- get_indicators(
    q = 'id IN ("AFILIACIONES", "EMPLEO_REGISTRADO_AGRICULTURA")',
    order = "id ASC",
    fields = "+data",
    representation =
      "GEOGRAPHICAL[35003|35005],MEASURE[ABSOLUTE]",
    offset = 25
  )
  expect_equal(grep("offset=25", x = ind$selfLink), 1)
})


## get_indicators_code()
test_that("get_indicators_code() needs arguments to work", {
  expect_error(get_indicators_code())
})


test_that("get_indicators_code() needs existing codes", {
  expect_equal(length(get_indicators_code('TURISTA')), 0)
})


test_that("get_indicators_code() returns a list", {
  ind <- get_indicators_code('TURISTAS')
  expect_is(ind, "list")
})


## get_indicators_code_data()
test_that("get_indicators_code_data() needs arguments to work", {
  expect_error(get_indicators_code_data())
})

test_that("get_indicators_code_data() needs existing codes", {
  expect_equal(length(get_indicators_code_data('TURISTA')), 0)
})


test_that("get_indicators_code_data() returns a list", {
  ind <- get_indicators_code_data('TURISTAS')
  expect_is(ind, "list")
})
