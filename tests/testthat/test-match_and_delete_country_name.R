context("match_country_name, delete_country_name")

test_that("del_country_name of non existing object", {
  input <- c("SpecialNameForTestA", "SpecialNameForTestC")
  output <- c("None", "None")
  expect_equal(del_country_name(input), "Success")
  expect_equal(normalize_country_name(input), output)
})

test_that("match_country_name of simple name", {
  input_posnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_realnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  output <- c("SpecialNameForTestA", "SpecialNameForTestC")
  expect_equal(match_country_name(input_posnames, input_realnames), "Success")
  expect_equal(normalize_country_name(input_posnames), output)
})

test_that("del_country_name of existing object", {
  input <- c("SpecialNameForTestA", "SpecialNameForTestC")
  output <- c("None", "None")
  expect_equal(del_country_name(input), "Success")
  expect_equal(normalize_country_name(input), output)
})

test_that("match_country_name and correct priority", {
  input_posnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_realnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_priority <- c("1", "2")
  output <- c("SpecialNameForTestA", "SpecialNameForTestC")
  expect_equal(match_country_name(input_posnames, input_realnames, input_priority), "Success")
  expect_equal(normalize_country_name(input_posnames), output)
  expect_equal(del_country_name(input_posnames), "Success")
})

test_that("match_country_name and incorrect priority", {
  input_posnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_realnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_priority <- c(1, -5)
  expect_equal(match_country_name(input_posnames, input_realnames, input_priority), "Invalid arguments")
})

test_that("match_country_name and incorrect keys and values length", {
  input_posnames <- c("SpecialNameForTestA", "SpecialNameForTestC")
  input_realnames <- c("SpecialNameForTestA", "SpecialNameForTestC", "Unexpected element")
  expect_equal(match_country_name(input_posnames, input_realnames), "Invalid arguments")
})
