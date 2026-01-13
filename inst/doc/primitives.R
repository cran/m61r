## ----setup, include=FALSE-----------------------------------------------------
library(m61r)


## ----filter_eg----------------------------------------------------------------
tmp <- filter_(CO2, ~Plant == "Qn1")
head(tmp)


## ----select_eg----------------------------------------------------------------
tmp <- select_(CO2, ~c(Plant, Type))
head(tmp, 2)


## ----mutate_eg----------------------------------------------------------------
tmp <- mutate_(CO2, z = ~conc / uptake)
head(tmp, 2)


## ----summarise_eg-------------------------------------------------------------
# Global summary
summarise_(CO2, mean = ~mean(uptake), sd = ~sd(uptake))

# Grouped summary
g_info <- get_group_indices_(CO2, ~c(Type, Treatment))
summarise_(CO2, group_info = g_info, mean = ~mean(uptake))


## ----data_join, echo=FALSE----------------------------------------------------
authors <- data.frame(
    surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
    nationality = c("US", "Australia", "US", "UK", "Australia"))

books <- data.frame(
    name = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
    title = c("EDA", "MASS", "LISP-STAT", "Spatial", "Interactive"))


## ----join_eg------------------------------------------------------------------
inner_join_(authors, books, by.x = "surname", by.y = "name")


## ----reshape_eg---------------------------------------------------------------
df3 <- data.frame(id = 1:2, age = c(40, 50), dose.a1 = c(1, 2), dose.a2 = c(2, 1))
df4 <- gather_(df3, pivot = c("id", "age"))
df4


