my_lm <- function(formula, data) {
  if (class(formula) != "formula") {
    stop("It must be a formula class object.")
  }
  x <- model.matrix(formula, data = data)
  y <- model.response(model.frame(formula, data = data))
  coef <- round(solve(t(x) %*% x) %*% t(x) %*% y, 5)
  df <- nrow(data) - length(formula)
  sigma_sq <- sum((y - x %*% coef)^2 / df)
  se <- round(diag(sqrt(sigma_sq * solve(t(x) %*% x))), 5)
  test_stat <- round(coef / se, 3)
  p_val <- round(pt(abs(test_stat), df, lower.tail = F) * 2, 5)
  result <- cbind(coef, se, test_stat, p_val)
  colnames(result) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(as.table(result))
}
