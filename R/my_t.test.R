#' Student's t-Test function
#'
#' This function performs a one sample t-test in R.
#'
#' @param x a numeric vector of data.
#' @param alternative a character string specifying the alternative hypothesis.
#'   This should only accept \code{"two.sided"}, \code{"less"}, or \code{"greater"}.
#' @param mu a number indicating the null hypothesis value of the mean.
#' @keywords inference
#'
#' @return a list with elements:
#'
#'  \item{test_stat}{the numeric test statistic}
#'  \item{df}{the degrees of freedom}
#'  \item{alternative}{the value of the parameter alternative}
#'  \item{p_val}{the numeric p-value}
#'
#' @examples
#' trial <- rnorm(30, 4, 7)
#' t.test(trial, alternative = "less", mu = 4)
#'
#' @export
my_t.test <- function(x, alternative, mu) {
  if (alternative != "greater" && alternative != "less" && alternative != "two.sided") {
    stop('The alternative must be either "two.sided", "greater", or "less".')
  }
  true_mean <- mean(x)
  se <- sd(x)/sqrt(length(x))
  test_stat <- (true_mean - mu) / se
  df <- length(x) - 1
  if (alternative == "greater") {
    p_val <- pt(test_stat, df, lower.tail = F)
  } else if (alternative == "less") {
    p_val <- pt(test_stat, df)
  } else {
    p_val <- pt(abs(test_stat), df, lower.tail = F) * 2
  }
  result <- list("test_stat" = test_stat,
                 "df" = df,
                 "alternative" = alternative,
                 "p_val" = p_val)
  return(result)
}
