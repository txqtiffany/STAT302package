# library(dplyr)
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  fold <- sample(rep(1:k_cv, length = length(cl)))
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  class <- c()
  cv_err <- c()
  for (i in 1:k_cv) {
    data_train <- data %>% filter(split != i)
    data_test <- data %>% filter(split == i)
    perdiction <- class::knn(data_train, data_test, data_train$y, k_nn)
    cv_err[i] <- sum(perdiction[i] != data_train$y) / length(cl)
    if (cv_err[i] == mean(cv_err)) {
      class = class::knn(data, data, data$y, k_nn)
    }
  }
  output <- list("class" = class, "cv_err" = mean(cv_err))
  return(output)
}
