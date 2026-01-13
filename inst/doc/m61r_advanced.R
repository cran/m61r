## ----setup, include=FALSE-----------------------------------------------------
library(m61r)
set.seed(42)


## ----example_pipeline---------------------------------------------------------
p <- m61r(mtcars)
p$filter(~mpg > 20)
p$select(~c(mpg, cyl, hp))
p$mutate(hp_norm = ~hp / max(hp))
p$head()


## ----scoped_mutate_SD---------------------------------------------------------
p <- m61r(iris)
p$mutate(scaled = ~lapply(.SD()[, vapply(.SD(), is.numeric, logical(1))], 
                          function(x) x * 100))
p$head(3)


## ----scoped_mutate_select_cols------------------------------------------------
tmp <- m61r(mtcars)
tmp$mutate(all_num = ~lapply(.SD()[, .select_cols(.SD(), is.numeric)], 
                             function(x) x * 10))
tmp$head(3)


## ----conversions_numeric------------------------------------------------------
p <- m61r(mtcars)
# Convert all columns to numeric using lapply for Base R purity
p$mutate(~lapply(.SD(), as.numeric))


## ----normalization------------------------------------------------------------
p <- m61r(mtcars)
# Normalize only columns that contain the word "mpg" or "hp"
p$mutate(~lapply(.SD()[, grep("mpg|hp", names(.SD()))], function(x) x / max(x)))
p$head()


## ----case_when----------------------------------------------------------------
p <- m61r(mtcars)
p$mutate(category = ~case_when(
  mpg > 25, "Eco",
  mpg > 18, "Standard",
  "High-Perf"
))
head(p[, c("mpg", "category")], 5)


## ----across-------------------------------------------------------------------
p <- m61r(mtcars)
p$summarise(
  avg = ~across(c("mpg", "disp", "hp"), mean)
)


