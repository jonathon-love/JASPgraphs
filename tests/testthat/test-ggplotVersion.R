test_that("def", {
    
    obj <- as.numeric(unlist(packageVersion("ggplot2")))
    expect_identical(obj[1], 2)
})
