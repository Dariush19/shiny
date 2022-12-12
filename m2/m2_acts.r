dev.off()

library(ggmap)
library(ggplot2)
library(maps)
library(mapproj)
# or you can try e.g. require(maps)
map.cities()
map('state')
data <- read.csv("E:\\Personal_Files\\Dariush\\monash\\visual\\m1\\Household-heating-by-State-2008.csv", header=T)

head(data)
names(data)

names(data)[4] <- "MobileHomes"
names(data)

ag <- aggregate(MobileHomes ~ States, FUN = mean, data = data)
head(ag)
dim(ag)

m.usa <- map_data("state") 
head(m.usa)
dim(m.usa) 

df <- data.frame( region = tolower(ag$States), MobileHomes = ag$MobileHomes, stringsAsFactors = F)
dim(df)
head(df)


ggplot(df, aes(map_id = region)) +
  expand_limits(x = m.usa$long, y = m.usa$lat) +
  # draw a us map, fill = MobileHomes means color the map according to MobileHomes property
  geom_map(aes(fill = MobileHomes), map = m.usa) +
  # fix the ratio of the x and y axises, to match a map
  coord_map()


