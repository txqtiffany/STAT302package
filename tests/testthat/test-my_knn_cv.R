penguins_df <- na.omit(my_penguins)
train <- lapply(penguins_df[c("bill_length_mm", "bill_depth_mm",
                              "flipper_length_mm", "body_mass_g")], as.numeric)
cl <- as.numeric(penguins_df$species)
nearest_1 <- my_knn_cv(train, cl, 1, 5)

test_that("my_knn works", {
  expect_type(nearest_1, "list")
  expect_type(nearest_1$class, "integer")
  expect_type(nearest_1$cv_err, "double")
})

test_that("non numeric input for k_nn and k_cv throws error", {
  expect_error(my_knn_cv(train, cl, 1, "hello"))
  expect_error(my_knn_cv(train, cl, "stat302", 1))
})
