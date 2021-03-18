test_that("my_lm works mathematically", {
  expect_equal(my_lm(formula = lifeExp ~ gdpPercap + continent, data = my_gapminder)[, 1],
               summary(lm(formula = lifeExp ~ gdpPercap + continent, data = my_gapminder))$coefficients[, 1])
})
test_that("wrong alternative input throws error", {
  expect_error(my_lm("formula = lifeExp ~ gdpPercap + continent", data = my_gapminder))
})
