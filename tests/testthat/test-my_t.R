test_that("my_t.test works mathematically", {
  set.seed(302)
  trial <- rnorm(30, 4, 7)
  expect_equal(t.test(trial, alternative = "less", mu = 4)$p.value, my_t.test(trial, "less", 4)$p_val)
  expect_equal(t.test(trial, alternative = "greater", mu = 4)$p.value, my_t.test(trial, "greater", 4)$p_val)
  expect_equal(t.test(trial, alternative = "two.sided", mu = 4)$p.value, my_t.test(trial, "two.sided", 4)$p_val)
})

test_that("wrong alternative input throws error", {
  trial <- rnorm(30, 4, 7)
  expect_error(my_t.test(trial, alternative = "a string", mu = 4))
})
