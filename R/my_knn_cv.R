#' k-Nearest Neighbour Classification
#'
#' k-nearest neighbour classification for test set from training set.
#'  For each row of the test set, the k nearest (in Euclidean distance)
#'  training set vectors are found, and the classification is decided by
#'   majority vote, with ties broken at random. If there are ties for the
#'   kth nearest vector, all candidates are included in the vote.
#'
#' @param train input data frame
#' @param cl true class value of your training data
#' @param k_nn integer representing the number of neighbors
#' @param k_cv integer representing the number of folds
#' @keywords perdiction
#'
#' @return a list with objects
#'
#'  \item{class}{a vector of the predicted class Ŷ i for all observations}
#'  \item{cv_err}{a numeric with the cross-validation misclassification error}
#'
#' @examples
#' library(palmerpenguins)
#' data(package = "palmerpenguins")
#' penguins_df <- na.omit(penguins)
#' train <- lapply(
#'   penguins_df[c("bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g")],
#'    as.numeric)
#' cl <- as.numeric(penguins_df$species)
#' nearest_1 <- my_knn_cv(train, cl, 1, 5)
#' nearest_5 <- my_knn_cv(train, cl, 5, 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  fold <- sample(rep(1:k_cv, length = length(cl)))
  data <- data.frame("x" = train, "y" = cl, "splits" = fold)
  class <- c()
  cv_err <- c()
  for (i in 1:k_cv) {
    data_train <- data[data$splits != i, ]
    data_test <- data[data$splits == i, ]
    perdiction <- class::knn(data_train, data_test, data_train$y, k_nn)
    cv_err[i] <- sum(perdiction != data_test$y) / length(perdiction)
  }
  output <- list("class" = class::knn(data, data, data$y, k_nn), "cv_err" = mean(cv_err))
  return(output)
}

