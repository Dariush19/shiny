library(ggmap) 
library(ggplot2) 
library(maps) 
library(mapproj) 
map('state')
data <- read.csv("E:\\Personal_Files\\Dariush\\monash\\visual\\m1\\Household-heating-by-State-2008.csv", header=T)
head(data) 
names(data)
names(data)[4] <- "MobileHomes"
names(data)

ag <- aggregate(MobileHomes ~ States, FUN = mean, data = data)
m.usa <- map_data("state")
head(m.usa) 
dim(m.usa) 
df <- data.frame(
  region = tolower(ag$States), 
  MobileHomes = ag$MobileHomes,
  stringsAsFactors = F
) 
dim(df)