### R code from vignette source 'm61r.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: m61r.Rnw:25-26
###################################################
library(m61r)


###################################################
### code chunk number 2: edit1
###################################################
co2 <- m61r(CO2)
co2$filter(~Plant %in% c("Qn1","Qc3"))
co2$mutate(z1=~uptake/conc,y=~conc/100)
co2$group_by(~c(Type,Treatment))
co2$summarise(foo=~mean(z1),bar=~sd(y))
co2 # print results

head(co2) # back to normal




###################################################
### code chunk number 3: edit2
###################################################
co2 <- m61r(CO2)
co2$filter(~Plant %in% c("Qn1","Qc3"))
co2$transmutate(z1=~uptake/conc,y=~conc/100)
tmp <- co2[] # get only the data.frame and not the whole m61r object

head(tmp)

class(tmp)



###################################################
### code chunk number 4: edit3
###################################################
co2 <- m61r(CO2)
head(co2)
names(co2)
dim(co2)
co2[1,]
head(co2[,2:3])
co2[1:10,1:3]
co2[1,"Plant"]
str(co2)

co2[1,"conc"] <- 100
co2[1,] # w/temporary change
co2[1,] # back to normal

# WARNING: Keep the brackets to manipulate the intern data.frame
co2[] <- co2[-1,]
co2[1:3,] # temporary result
co2[1:3,] # back to normal

# ... OR you will destroy co2, and only keep the data.frame
# co2 <- co2[-1,]
# class(co2) # data.frame

# cloning
foo <- co2 # This will only create
           # a second variable that points
           # on the same object (i.e not cloning)
str(co2)
str(foo)

# Instead, cloning into a new environment
foo <- co2$clone()
str(co2)
str(foo)



