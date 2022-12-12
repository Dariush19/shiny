library(maptools)
gpclibPermit()

install.packages("gpclib")
gpclibPermit()

nz <- sf::st_read("NZL_adm0")
plot(nz)

world <- readShapeSpatial("ne_110m_land")
plot(world)