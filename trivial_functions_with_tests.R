# Example of how to use testthat

library(testthat)

trivial_function.1 <- function() { TRUE }

trivial_function.2 <- function() { 
  return(TRUE)
}

trivial_function.3 <- function() {
  print(TRUE)
}

trivial_function.4 <- function() {
  print(TRUE)
  return()
}

test_that('Lalala, trivial_function.1 returns TRUE', {
  expect_that(trivial_function.1(),
              is_true())
})

test_that('trivial_function.2 returns TRUE', {
  expect_that(trivial_function.2(),
              equals(TRUE))
})

test_that('trivial_function.3 prints TRUE', {
  expect_that(trivial_function.3(),
              prints_text("TRUE"))
})

test_that('trivial_function.4 only prints TRUE', {
  expect_that(trivial_function.4(),
              prints_text("TRUE"))
  expect_that(is.null(trivial_function.4()),
              is_true())
  
})