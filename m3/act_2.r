dev.off()
library(tmaptools)
# Convert location/address to its lat/long coordinates:
geocode_OSM("Melbourne")

?get_stamenmap 

library(ggmap)
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

#####################################################
update.packages(ask = FALSE, checkBuilt = TRUE)
install.packages(c("curl", "yaml"))
install.packages("devtools") 
devtools::install_github("hadley/ggplot2@v2.2.0")
devtools::install_github("dkahle/ggmap")

require(mapproj)
# get map data (lat &amp;amp; lon for boundaries in this case)
m <- map("us", plot = FALSE) 

map(m, project = "mercator") # try mercator first
map.grid(m) # draw graticules

# change the projection to albers
map(m, project = "albers", par=c(39,45))
map.grid(m) # draw graticules to compare more easily

#######################################
# get unprojected world limits
m <- map('world', plot = FALSE)
# center on New York
map(m, proj = 'azequalarea', orient = c(41,-74,0))
map.grid(m, col = 2) # draw graticules