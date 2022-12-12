library(maps) 
map("nz")

library(ggmap)# load ggmap

# Define location 3 ways
# 1. location/address
myLocation1 <- "Melbourne"
myLocation1

# 2. lat/long
myLocation2 <- c(lon=-95.3632715, lat=29.7632836)# not "Melbourne"
myLocation2

# 3. an area or bounding box (4 points), lower left lon, 
# lower left lat, upper right lon, upper right lat
# (a little glitchy for google maps)
myLocation3 <- c(-130, 30, -105, 50)
myLocation3


library(tmaptools)
# Convert location/address to its lat/long coordinates:
geocode_OSM("Melbourne")

?get_stamenmap 


myLocation4 <- geocode_OSM("Melbourne")
bboxVector <- as.vector(myLocation4$bbox)

bbox1 <- c(
  left = bboxVector[1], 
  bottom = bboxVector[2], 
  right = bboxVector[3], 
  top = bboxVector[4]
)

myMap <- get_stamenmap(
  bbox = bbox1, 
  maptype = "watercolor",
  zoom = 13
)
ggmap(myMap)