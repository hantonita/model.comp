test_data <- gapminder::gapminder

# note: more tests will be added as the function becomes more complex
test_that("compare function works for logistic regression model", {
  # create the expected dataframe containing model & fitted values
  mod <- stats::glm(data = test_data, formula = lifeExp ~gdpPercap)
  fitted_vals <- list(list(stats::fitted(mod)))
  df <- data.frame(matrix(ncol = 1, nrow = 1), row.names = c('logreg'))
  colnames(df) <- c('fitted_values')
  df['logreg', 'fitted_values'] <- fitted_vals

  # run test
  expect_equal(compare_models(data = test_data, eqn = "lifeExp ~ gdpPercap"), df)
})

