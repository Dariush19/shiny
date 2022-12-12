library(geosphere)
map("state")
lat_ca <- 39.164141
lon_ca <- -121.640625

lat_me <- 45.213004
lon_me <- -68.906250

inter <- gcIntermediate(
  c(lon_ca,lat_ca),
  c(lon_me,lat_me),
  n = 50,
  addStartEnd=TRUE
)
lines(inter)

airports <- read.csv("http://datasets.flowingdata.com/tuts/maparcs/airports.csv", header = TRUE)
flights <- read.csv("http://datasets.flowingdata.com/tuts/maparcs/flights.csv", header = TRUE, as.is = TRUE)

head(airports)
head(flights)

# create a world map and limited it to around US areas.
xlim <- c(-171.738281, -56.601563)
ylim <- c(12.039321, 71.856229)
map(
  "world", 
  col="#f2f2f2", 
  fill=TRUE, 
  bg="white", 
  lwd=0.05, 
  xlim=xlim, 
  ylim=ylim
)

fsub <- flights[flights$airline == "AA",]

for(j in 1:length(fsub$airline))
{
  air1 <- airports[
    airports$iata == fsub[
      j,]$airport1,]
  
  air2 <- airports[
    airports$iata == fsub[
      j,]$airport2,]
  
  inter <- gcIntermediate(
    c(
      air1[1,]$long,
      air1[1,]$lat
    ),
    c(
      air2[1,]$long,
      air2[1,]$lat
    ),
    n = 100,
    addStartEnd = TRUE
  )
  
  lines(inter, col="black", lwd=0.8)
}