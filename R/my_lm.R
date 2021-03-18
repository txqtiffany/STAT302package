#' Fitting Linear Models
#'
#' This function is used to fit linear models in R.
#'
#' @param formula a \code{formula} class object, similar to \code{lm()}.
#' @param data input data frame.
#' @keywords inference, perdiction
#'
#' @return a table with rows for each coefficient and columns for the
#'   Estimate, Std. Error, t value, and Pr(>|t|).
#'
#' @examples
#' my_lm(formula = mpg ~ hp + wt, data = mtcars)
#'
#' @export
my_lm <- function(formula, data) {
  if (class(formula) != "formula") {
    stop("It must be a formula class object.")
  }
  x <- model.matrix(formula, data = data)
  y <- model.response(model.frame(formula, data = data))
  coef <- solve(t(x) %*% x) %*% t(x) %*% y
  df <- nrow(data) - length(formula)
  sigma_sq <- sum((y - x %*% coef)^2 / df)
  se <- diag(sqrt(abs(sigma_sq * solve(t(x) %*% x))))
  test_stat <- coef / se
  p_val <- pt(abs(test_stat), df, lower.tail = F) * 2
  result <- cbind(coef, se, test_stat, p_val)
  colnames(result) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(as.table(result))
}
