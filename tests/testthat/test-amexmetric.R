test_that("top_four_percent_captured works", {
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), seq(100, 1)), 1)
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), seq(1, 100)), 0)
  expect_equal(top_four_percent_captured(c(rep(1, 4), rep(0, 96)), c(1, 1, 0, 0, rep(0.2, 96))), 0.5)
})
