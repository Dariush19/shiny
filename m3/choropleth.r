data(unemp)

# set up intervals
Intervals <-as.numeric(
  cut(
    unemp$unemp,
    c(0,2,4,6,8,10,100)
  )
)

data(county.fips)
Matches <- Intervals[
  match(
    county.fips$fips,
    unemp$fips
  )
  ]

colors <- c("#ffffd4","#fee391","#fec44f","#fe9929","#d95f0e","#993404")
# draw map
map("county", 
    col = colors[Matches], 
    fill = TRUE,
    resolution = 0,
    lty = 0,
    projection = "polyconic"
)

map("world",
    col = "purple",
    fill = FALSE,
    add = TRUE,
    lty = 1,
    lwd = 0.3,
    projection = "polyconic"
)

#add title and legend
title("Unemployment by county, 2009")

Legend <- c("<2%","2-4%","4-6%","6-8%","8-10%",">10%")
legend("topright", Legend, horiz = TRUE, fill = colors)

######################################
install.packages('rworldmap')
library(rworldmap)


mapDevice('x11')

myMap <- joinCountryData2Map( covid_ag, 
                               nameJoinColumn="Country", 
                               joinCode="NAME" )

colourPalette <- RColorBrewer::brewer.pal(10,'Spectral')

#plot the map
mapCountryData( myMap,
                nameColumnToPlot='confirmed_acc_count',
                catMethod='fixedWidth',
                colourPalette=colourPalette, #'diverging', 'heat'
                numCats=100)