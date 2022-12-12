require(ggplot2)
ggplot(mtcars, aes(mpg, hp)) + geom_histogram()

head(mtcars)
names(mtcars)
names(mtcars[1]) <- "make"
colnames(mtcars)
mtcars[2](mtcars)

summary(mtcars)

df <- read.csv("E:\\Personal_Files\\Dariush\\monash\\visual\\AS1\\2019_nCoV_data.csv", 
               header=TRUE, row.names="Sno")

head(df)

df2 <- read.csv("E:\\Personal_Files\\Dariush\\monash\\visual\\AS1\\2019_nCoV_data.csv", 
               header=TRUE)

rownames(mtcars) <- c()
names(mtcars)
data(mtcars)

library(dplyr)
df2 <- tibble::rownames_to_column(mtcars, "manufacturer")
head(df2)
ggplot(df2, aes(x=manufacturer, y=as.numeric(mpg))) + geom_bar(stat = "identity") + 
  facet_grid(df2$manufacturer)

summary(df2)
ggplot(df2, aes(x=manufacturer)) + geom_bar(stat = "count")