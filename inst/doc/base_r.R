### R code from vignette source 'base_r.Rnw'

###################################################
### code chunk number 1: base_r.Rnw:21-22
###################################################
library(m61r)


###################################################
### code chunk number 2: edit1
###################################################
tmp <- filter_(CO2,~Plant=="Qn1")
head(tmp)



###################################################
### code chunk number 3: edit2
###################################################
tmp <- filter_(CO2,~Type=="Quebec")
head(tmp)



###################################################
### code chunk number 4: edit3
###################################################
tmp <- select_(CO2,~Type)
head(tmp)



###################################################
### code chunk number 5: edit4
###################################################
tmp <- select_(CO2,~c(Plant,Type))
head(tmp)



###################################################
### code chunk number 6: edit5
###################################################
tmp <- select_(CO2,~-Type)
head(tmp)



###################################################
### code chunk number 7: edit6
###################################################
tmp <- select_(CO2,variable=~-(Plant:Treatment))
head(tmp)



###################################################
### code chunk number 8: edit7
###################################################
tmp <- mutate_(CO2,z=~conc/uptake)
head(tmp)



###################################################
### code chunk number 9: edit8
###################################################
tmp <- mutate_(CO2,mean=~mean(uptake))
head(tmp)



###################################################
### code chunk number 10: edit9
###################################################
tmp <- mutate_(CO2,z1=~uptake/conc,y=~conc/100)
head(tmp)



###################################################
### code chunk number 11: edit10
###################################################
tmp <- transmutate_(CO2,z2=~uptake/conc,y2=~conc/100)
head(tmp)



###################################################
### code chunk number 12: edit11
###################################################
tmp <- summarise_(CO2,mean=~mean(uptake),sd=~sd(uptake))
tmp



###################################################
### code chunk number 13: edit12
###################################################
tmp <- summarise_(CO2, group=~c(Type,Treatment),mean=~mean(uptake),sd=~sd(uptake))
tmp



###################################################
### code chunk number 14: edit13
###################################################
tmp <- arrange_(CO2,~c(conc))
head(tmp)



###################################################
### code chunk number 15: edit14
###################################################
tmp <- arrange_(CO2,~c(Treatment,conc,uptake))
head(tmp)



###################################################
### code chunk number 16: edit15
###################################################
tmp <- desange_(CO2,~c(Treatment,conc,uptake))
head(tmp)



###################################################
### code chunk number 17: edit16
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))


###################################################
### code chunk number 18: edit17
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))
tmp <- inner_join_(authors,books, by.x = "surname", by.y = "name")
tmp



###################################################
### code chunk number 19: edit18
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))
tmp <- left_join_(authors,books, by.x = "surname", by.y = "name")
tmp



###################################################
### code chunk number 20: edit19
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))

tmp <- right_join_(authors,books, by.x = "surname", by.y = "name")
tmp



###################################################
### code chunk number 21: edit20
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))
tmp <- full_join_(authors,books, by.x = "surname", by.y = "name")
tmp



###################################################
### code chunk number 22: edit21
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))
tmp <- semi_join_(authors,books, by.x = "surname", by.y = "name")
tmp



###################################################
### code chunk number 23: edit22
###################################################
authors <- data.frame(
             surname = I(c("Tukey", "Venables", "Tierney", "Ripley", "McNeil")),
             nationality = c("US", "Australia", "US", "UK", "Australia"),
             deceased = c("yes", rep("no", 4)))

books <- data.frame(
           name = I(c("Tukey", "Venables", "Tierney","Ripley",
                 "Ripley", "McNeil", "R Core")),
           title = c("Exploratory Data Analysis",
                 "Modern Applied Statistics ...",
                 "LISP-STAT",
                 "Spatial Statistics", "Stochastic Simulation",
                 "Interactive Data Analysis",
                 "An Introduction to R"),
            other.author = c(NA, "Ripley", NA, NA, NA, NA,"Venables & Smith"))
tmp <- anti_join_(authors,books, by.x = "surname", by.y = "name")
tmp

tmp <- anti_join_(books,authors, by.x = "name", by.y = "surname")
tmp



###################################################
### code chunk number 24: edit23
###################################################
df3 <- data.frame(id = 1:4,
                  age = c(40,50,60,50),
                  dose.a1 = c(1,2,1,2),
                  dose.a2 = c(2,1,2,1),
                  dose.a14 = c(3,3,3,3))

df3

gather_(df3,pivot = c("id","age"))



###################################################
### code chunk number 25: edit24
###################################################
df3 <- data.frame(id = 1:4,
                  age = c(40,50,60,50),
                  dose.a1 = c(1,2,1,2),
                  dose.a2 = c(2,1,2,1),
                  dose.a14 = c(3,3,3,3))

df3

gather_(df3,pivot = c("id","age"))

df4 <- gather_(df3,pivot = c("id","age"))
df5 <- rbind(df4,
  data.frame(id=5, age=20,parameters="dose.a14",values=8),
  data.frame(id=6, age=10,parameters="dose.a1",values=5))

df5

spread_(df5,col_name="parameters",col_values="values",pivot=c("id","age"))


