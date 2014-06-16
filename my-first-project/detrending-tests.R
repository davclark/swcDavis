# tests for my detrending work

require(testthat)
source('detrending.R')

# Something like this:
# sample.country.data <- data.frame(some data)
# expected.deviation <- c(some more data)

test_that('the column names are right', {
  
})

test_that('detrend.countries correctly detrends gpdPercap', {
  detrended.df <- detrend.countries(sample.country.data)
  expect_that(detrended.df$deviation, equals(correct.deviation))
})