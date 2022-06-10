#' @import dplyr

amex_metric <- function(actual, predicted) {
  g <- normalized_weighted_gini(actual, predicted)
  d <- top_four_percent_captured(actual, predicted)

  0.5 * (g + d)
}

top_four_percent_captured <- function(actual, predicted) {
  df <- tibble(actual, predicted) %>%
    arrange(desc(predicted)) %>%
    mutate(weight = if_else(actual == 0, 20, 1))

  four_pct_cutoff <- as.integer(0.04 * sum(pull(df, weight)))

  df_cutoff <- df %>%
    mutate(weight_cumsum = cumsum(weight)) %>%
    filter(weight_cumsum <= four_pct_cutoff)

  sum(pull(df_cutoff, actual) == 1) / sum(pull(df, actual) == 1)
}

weighted_gini <- function(actual, predicted) {
  df <- tibble(actual, predicted) %>%
    arrange(desc(predicted)) %>%
    mutate(weight = if_else(actual == 0, 20, 1)) %>%
    mutate(random = cumsum(weight / sum(weight)))

  total_pos <- df %>%
    summarise(sum(actual * weight)) %>%
    pull

  df %>%
    mutate(cum_pos_found = cumsum(actual * weight)) %>%
    mutate(lorentz = cum_pos_found / total_pos) %>%
    mutate(gini = (lorentz - random) * weight) %>%
    summarise(sum(gini)) %>%
    pull
}

normalized_weighted_gini <- function(actual, predicted) {
  weighted_gini(actual, predicted) / weighted_gini(actual, actual)
}
