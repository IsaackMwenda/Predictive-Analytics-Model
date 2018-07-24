#! /usr/bin/env Rscript
library(plumber, quietly = TRUE)
r <- plumb("Model_API.r")
r$run(port = 7234)
