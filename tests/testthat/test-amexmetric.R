test_that("top_four_percent_captured works", {
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), seq(100, 1)), 1)
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), seq(1, 100)), 0)
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), c(1, 1, 0, 0, rep(0.2, 96))), 0.5)
})

test_that("weighted_gini works", {
  expect_equal(weighted_gini(c(1, 0, 0, 0), 4:1), 20.655738)
  expect_equal(weighted_gini(c(0, 1, 0, 0), 4:1), 0.6557377)
})
