library(maptools)
install.packages("gpclib")
gpclibPermit()

nz <- readShapeSpatial("E:\\Personal_Files\\Dariush\\monash\\visual\\m3\\shapes\\NZL_adm0")
plot(nz)
world <- readShapeSpatial("ne_110m_land")
plot(world)


head(world_shp)
world_map <- fortify(world_shp) # convert into a tabular structure
head(world_map)

library(ggplot2)
world_shp <- readShapePoly("E:\\Personal_Files\\Dariush\\monash\\visual\\m3\\shapes\\ne_110m_land.shp")
ggplot(
  world_shp,
  aes(
    x=long,
    y=lat,
    group=group
  )
) +
  geom_path()


ggplot(
  world_map,
  aes(
    x=long,
    y=lat,
    group=group
  )
) +
  geom_path()







# #############
library(ggmap) # Load the shapes and transform
library(maptools)
area <- readShapePoly("E:\\Personal_Files\\Dariush\\monash\\visual\\m3\\shapes\\ne_10m_parks_and_protected_lands_area.shp")
area.points <- fortify(area)


###################
library(RColorBrewer)
colors <- brewer.pal(9,"BuGn")
margin = 15
bbox1 <- c(
  left = -118 - margin,
  bottom = 37.5 - margin,
  right = -118 + margin,
  top = 37.5 + margin
)
# Get the underlying map, it may take a while to get (from stamen)
# Remmerber? Google Map needs an API key...
mapImage <- get_stamenmap(
  bbox = bbox1,
  color = "color",
  maptype = "terrain",
  zoom =6
)
# Put the shapes on top of the map
ggmap(mapImage) +
  geom_polygon(
    aes(x=long, y=lat, group=group),
    data = area.points,
    color = colors[9],
    fill = colors[6],
    alpha =0.5
  ) +
  labs(x="Longitude", y="Latitude")

