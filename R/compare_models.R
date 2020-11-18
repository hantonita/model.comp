#' Compare some performance measures of models fitted to your data.
#'
#' @param data data.frame containing at least the response and all explanatory variables in your equation
#' @param eqn string specifying the formula for the models to fit
#' @param models vector/list of the names of models (as strings) to compare - currently supports logistic regression
#' (logreg)
#' @param outputs vector/list specifying, as strings, the types of outputs that should be returned - currently supports
#' the fitted/predicted values for the data given, calculated with the model fitted (fitted_values)
#'
#' @return Returns a data.frame with a row for each model fitted and columns for each output requested.
#' @export
#'
#' @examples
#' compare_models(data = gapminder::gapminder, eqn = "lifeExp ~ gdpPercap", models = c('logreg'))
compare_models <- function(data, eqn, models = c('logreg'), outputs = c('fitted_values')) {
  # note for now this just returns fitted values for logistic regression, in the future will
  # implement performance metrics to compare models

  set.seed(123)

  fitted <- data.frame(matrix(ncol = length(outputs), nrow = length(models)), row.names = models)
  colnames(fitted) <- c(outputs)

  for (model in models) {
    if (model == 'logreg') {
      fitted_model <- stats::glm(formula = eqn, data = data)
      fitted_values <- stats::fitted(fitted_model)
    }
    # } else if (model == 'cart') {
    #   fitted_model <- rpart::rpart(formula = eqn, data = data, method = 'anova', set.seed(123))
    #   fitted_values <- stats::predict(fitted_model)
    # } else if (model == 'prune') {
    #   fitted_model <- rpart::rpart(formula = eqn, data = data, method = 'anova')
    #   fitted_model <- rpart::prune(fitted_model, cp = fitted_model$cptable[which.min(fitted_model$cptable[,"xerror"]),"CP"])
    #   fitted_values <- stats::predict(fitted_model)
    # }

    fitted[model, 'fitted_values'] <- list(list(fitted_values))

    return(fitted)
  }


}
