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
