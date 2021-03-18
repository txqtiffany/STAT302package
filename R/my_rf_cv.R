#' Random Forest Cross-Validation
#'
#' This function implements random forest algorithm for classification and regression.
#'
#' @param k number of folds
#' @keywords perdiction
#'
#' @return a numeric with the cross-validation error
#'
#' @examples
#' library(palmerpenguins)
#' data(package = "palmerpenguins")
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k) {
  my_penguins <- STAT302package::my_penguins
  fold <- sample(rep(1:k, length = length(na.omit(my_penguins)$species)))
  data <- data.frame(na.omit(my_penguins), "split" = fold)
  mse <- c()
  for (i in 1:k) {
    data_train <- data[data$splits != i, ]
    data_test <- data[data$splits == i, ]
    rf_model <- randomForest::randomForest(body_mass_g ~ bill_length_mm +
                                             bill_depth_mm + flipper_length_mm,
                                           data = data_train, ntree = 100)
    rf_predict <- predict(rf_model, data_test[, -1])
    mse[i] <- sum((rf_predict - data_test$body_mass_g)^2) / length(data_test)
  }
  output <- mean(mse)
  return(output)
}
