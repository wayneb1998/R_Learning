
# loading and viewing the dataset -----------------------------------------


library(datasets)
data(iris)
?iris
View(iris)


# summary statistics ------------------------------------------------------

#general
View(iris)
iris

#head & tail
headiris <- head(iris, 4)
tailiris <- tail(iris, 4)
View(headiris)
View(tailiris)

#summary()
summary(iris)
summary(iris$Sepal.Length)

sum(is.na(iris))

#skimr to expand on summary commands
install.packages("skimr")
library(skimr)
skim(iris)

#grouping
iris %>%
  dplyr::group_by(Species) %>%
  skim()

?dplyr
