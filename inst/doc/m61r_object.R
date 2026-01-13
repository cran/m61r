## ----setup, include=FALSE-----------------------------------------------------
library(m61r)


## ----edit1--------------------------------------------------------------------
co2 <- m61r(CO2)
co2$filter(~Plant %in% c("Qn1", "Qc3"))
co2$mutate(z1 = ~uptake/conc, y = ~conc/100)
co2$group_by(~c(Type, Treatment))
co2$summarise(foo = ~mean(z1), bar = ~sd(y))
co2$head()

# View the internal data.frame
co2[]


## ----edit2--------------------------------------------------------------------
co2 <- m61r(CO2)
co2$filter(~Plant %in% c("Qn1", "Qc3"))
co2$transmutate(z1 = ~uptake/conc, y = ~conc/100)
co2$head()

# Get only the data.frame and not the whole m61r object
tmp <- co2[]

class(tmp)


## ----edit3--------------------------------------------------------------------
co2 <- m61r(CO2)
names(co2)
dim(co2)
co2[1,]
co2[1:10, 1:3]
co2[1, "Plant"]
str(co2)

# Sub-assignment (temporary changes)
co2[1, "conc"] <- 100
co2[1,]


## ----cloning------------------------------------------------------------------
# Cloning into a new environment
foo <- co2$clone()

# Verify they are distinct objects in memory
str(co2)
str(foo)


