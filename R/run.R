library(plumber)
r <- plumb("R/deploy.R")
r$run(port=8000)
