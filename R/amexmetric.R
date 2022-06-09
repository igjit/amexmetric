#' @import dplyr

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
