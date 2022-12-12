library(ggmap)# load ggmap
# Define location 3 ways
# 1. location/address
myLocation1 <- "Melbourne"
# 2. lat/long
myLocation2 <- c(lon=-95.3632715, lat=29.7632836)# not "Melbourne"
myLocation2
# 3. an area or bounding box (4 points), lower left lon,
# low?r left lat, upper right lon, upper right lat
# (a little glitchy for google maps)
myLocation3

library(tmaptools)
# Convert location/address to its lat/long coordinates:
geocode_OSM("Tehran")
# Yes, Melbourne is where

?get_stamenmap

myLocation4 <- geocod?_OSM("MyTIme")
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
ggmap(my?ap)

###################

update.packages(ask = FALSE, checkBuilt = TRUE)
install.packages(c("curl", "yaml"))
install.packages("devtools")
devtools::install_github("hadley/ggplot2@v2.2.0")
devtools::install_github("dkahle/ggmap")
require(mapproj)
# get map?data (lat &amp;amp; lon for boundaries in this case)
m <- map("usa", plot = FALSE)
map(m, project = "mercator") # try mercator first
map.grid(m) # draw graticules
# change the projection to albers
map(m, project = "albers", par=c(39,45))
map.grid(m) # draw?graticules to compare more easily
# Let's move on to the whole world.
# get unprojected world limits
m <- map('world', plot = FALSE)
# center on New York
map(m, proj = 'azequalarea', orient = c(41,-74,0))
map.grid(m, col = 2) # draw graticules



map(m, pr?j = 'orth', orient = c(41,-74,0))
map.grid(m, col = 2, nx = 10, ny = 15, label = FALSE, lty = 5)
points(
  mapproject(
    list(y = 41, x = -74)
  ),
  col = 3,
  pch = "x",
  cex = 5
)# centre on NY


map("state", proj='bonne', param=45)
data(state)
text(?  mapproject(
    state.center
  ),
  state.abb
)

map("state",proj='bonne', param=45)
text(
  mapproject(
    state.center,
    proj='bonne',
    param=45
  ),
  state.abb
)



murder <- subset(crime, offense == "murder")
qmplot(lon, lat,
       data = mu?der,
       colour = I('red'),
       size = I(3),
       darken = .3
)

