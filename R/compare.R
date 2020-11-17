#' Compare some performance measures of models fitted to your data
#'
#' @param data data.frame containing at least the response and all explanatory variables in your equation
#' @param eqn string specifying the formula for the models to fit
#' @param models vector/list of the names of models to compare - currently supports logistic regression
#' (logreg), classification and regression trees (cart), and pruned classification/regression trees (prune)
#' @param outputs vector/list specifying the types of outputs that should be returned - currently supports
#' the model fitted (fitted_model), and the fitted/predicted values for the data given, calculated with
#' the model fitted (fitted_values)
#'
#' @return returns a data.frame with a row for each model fitted and columns for each output requested
#' @export
#'
#' @examples
#' librart(gapminder)
#' compare(data = gapminder, eqn = "lifeExp ~ gdpPercap", models = c('logreg')
compare <- function(data, eqn, models = c('logreg'), outputs = c('fitted_model', 'fitted_values')) {
  fitted <- data.frame(matrix(ncol = length(outputs), nrow = length(models)), row.names = models)
  colnames(fitted) <- c(outputs)
  print('fitted: ')
  print(fitted)

  for (model in models) {
    if (model == 'logreg') {
      fitted_model <- glm(formula = eqn, data = data)
      print('fitted model: ')
      print(fitted_model)
      fitted_values <- fitted(fitted_model)
      print('fitted values: ')
      print(fitted_values)
    } else if (model == 'cart') {
      fitted_model <- rpart::rpart(formula = eqn, data = data, method = 'anova')
      fitted_values <- rpart::predict.rpart(fitted_model)
    } else if (model == 'prune') {
      fitted_model <- rpart::rpart(formula = eqn, data = data, method = 'anova')
      fitted_model <- rpart::prune(fitted_model, cp = fitted_model$cptable[which.min(fitted_model$cptable[,"xerror"]),"CP"])
      fitted_values <- rpart::predict.rpart(fitted_model)
    }

    fitted[model, 'fitted_model'] <- list(fitted_model)
    fitted[model, 'fitted_values'] <- list(list(fitted_values))

    return(fitted)
  }


}
