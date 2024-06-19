test_that("Does API Connect", {
  expect_equal(
      bb_get_func(
          api_url = bb_url_base_list$school,
          url1 = bb_url_school_list$roles,
              ))
})
