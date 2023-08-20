
x <- stats::rnorm(100)

test_that("zScore works", {
  expect_equal(length(normalise(x, norm_method = "zScore")), length(x))
})

test_that("MinMax works", {
  expect_equal(length(normalise(x, norm_method = "MinMax")), length(x))
})

test_that("Sigmoid works", {
  expect_equal(length(normalise(x, norm_method = "Sigmoid")), length(x))
})

test_that("RobustSigmoid works", {
  expect_equal(length(normalise(x, norm_method = "RobustSigmoid")), length(x))
})

test_that("MaxAbs works", {
  expect_equal(length(normalise(x, norm_method = "MaxAbs")), length(x))
})
