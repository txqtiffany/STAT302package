# library(dplyr)
# my_rf_cv <- function(k) {
#   fold <- sample(rep(1:k, length = length(na.omit(penguins)$species)))
#   data <- data.frame(na.omit(penguins), "split" = fold)
#   mse <- c()
#   for (i in 1:k) {
#     data_train <- data %>% filter(split != i)
#     data_test <- data %>% filter(split == i)
#     rf_model <- randomForest::randomForest(body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm, data = data_train, ntree = 100)
#     rf_predict <- predict(rf_model, data_test[, -1])
#     mse[i] <- sum((rf_predict - data_test$body_mass_g)^2) / length(data_test)
#   }
#   output <- mean(mse)
#   return(output)
# }
