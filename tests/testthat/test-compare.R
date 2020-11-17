test_data <- gapminder::gapminder

test_that("compare function works for logistic regression model", {
  # create the expected dataframe containg model & fitted values
  mod <- stats::glm(data = test_data, formula = lifeExp ~gdpPercap)
  fitted_vals <- list(list(stats::fitted(mod)))
  df <- data.frame(matrix(ncol = 2, nrow = 1), row.names = c('logreg'))
  colnames(df) <- c('fitted_model', 'fitted_values')
  df['logreg', 'fitted_model'] <- list(mod)
  df['logreg', 'fitted_values'] <- fitted_vals

  # run test
  expect_equal(compare_models(data = test_data, eqn = "lifeExp ~ gdpPercap"), df)
})

# test_that("compare function works for multiple models", {
#   mod <- glm(data = gapminder, formula = lifeExp ~gdpPercap)
#   fitted_vals <- list(list(fitted(mod)))
#   df <- data.frame(matrix(ncol = 2, nrow = 1), row.names = c('logreg'))
#   colnames(df) <- c('fitted_model', 'fitted_values')
#   df['logreg', 'fitted_model'] <- list(mod)
#   df['logreg', 'fitted_values'] <- fitted_vals
#   expect_equal(compare(data = test_data, eqn = "lifeExp ~ gdpPercap"), df)
# })
#
# test_that("compare function works for logistic regression model", {
#   mod <- glm(data = gapminder, formula = lifeExp ~gdpPercap)
#   fitted_vals <- list(list(fitted(mod)))
#   df <- data.frame(matrix(ncol = 2, nrow = 1), row.names = c('logreg'))
#   colnames(df) <- c('fitted_model', 'fitted_values')
#   df['logreg', 'fitted_model'] <- list(mod)
#   df['logreg', 'fitted_values'] <- fitted_vals
#   expect_equal(compare(data = test_data, eqn = "lifeExp ~ gdpPercap"), df)
# })
