install.packages("leaflet")
library(leaflet)
m <- leaflet() %>%
  setView(lng = 51.3890, lat = 35.6892, zoom = 20) %>%
  addTiles()
m <- addTiles(m)
m


m <- leaflet()
m <- setView(m, lng = 145.0431, lat = -37.8773, zoom = 15)
m <- addTiles(m)
m



data <-?read.csv("E:\\Personal_Files\\Dariush\\monash\\visual\\m3\\vet_schools_in_victoria.csv")
head(data)
leaflet(data = data[1:30, ]) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(location))

###############

data <- read.csv("E:\?Personal_Files\\Dariush\\monash\\visual\\m3\\Household-heating-by-State-2008.csv", header=T)
names(data)[4] <- "MobileHomes"
ag <- aggregate(MobileHomes ~ States, FUN = mean, data = data)
ag$States <- tolower(ag$States)
#Let's prepare the map data and link?the two data sets.
library(maps)
mapStates <- map("state", fill = TRUE, plot = FALSE)

# find the related rate for each state
rates <- ag$MobileHomes[match(mapStates$names, ag$States)]
#Now, it is time to use leaflet.
library(leaflet)
cpal <- colorNumeric(?Blues", rates) # prepare the color mapping
leaflet(mapStates) %>% # create a blank canvas
  addTiles() %>% # add tile
  addPolygons( # draw polygons on top of the base map (tile)
    stroke = FALSE,
    smoothFactor = 0.2,
    fillOpacity = 1,
    color = ?cpal(rates) # use the rate of each state to find the correct color
  )

################
# split the string with : as seperator
spliteNames <- strsplit(mapStates$names, ":")

# get first part of the origin string;
# e.g. get washington from washington:san ?uan island
firstPartNames <- lapply(spliteNames, function(x) x[1])
rates <- ag$MobileHomes[match(firstPartNames, ag$States)]

cpal <- colorNumeric("Blues", rates) # prepare the color mapping
leaflet(mapStates) %>% # create a blank canvas
  addTiles() %>% #?add tile
  addPolygons( # draw polygons on top of the base map (tile)
    stroke = FALSE,
    smoothFactor = 0.2,
    fillOpacity = 1,
    color = ~cpal(rates) # use the rate of each state to find the correct color
  )


############

library(rgdal)
world_?ap <- readOGR("ne_50m_admin_0_countries.shp")
gdp_data <- read.csv("WorldGDP.csv")

world_map <- readOGR(".", "ne_50m_admin_0_countries")
#Match the gdp to each country.
rates <- gdp_data$GDP[match(world_map$admin, gdp_data$Name)]
#Create the map
library(l?aflet)
qpal <- colorQuantile("Blues", rates, 12) # prepare the color mapping
leaflet(world_map) %>% # create a blank canvas
  addTiles() %>% # add tile
  addPolygons( # draw polygons on top of the base map (tile)
    stroke = FALSE,
    smoothFactor = 0.2,?    fillOpacity = 1,
  )