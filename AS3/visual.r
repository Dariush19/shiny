library(ggmap) 
library(ggplot2) 
library(maps) 
library(mapproj)
library(rworldmap)

covid_df <- read.csv('E:/Personal_Files/Dariush/monash/visual/AS3/new/time_series_covid19_ALL_global.csv', header=TRUE)

#covid_ag <- aggregate(confirmed_inc_count ~ Country+Long+Lat, FUN = sum, data = covid_df)
covid_ag <- aggregate(confirmed_inc_count ~ Country, FUN = sum, data = covid_df)

N = 100
library(RColorBrewer)

myMap <- joinCountryData2Map( covid_ag, 
                              nameJoinColumn="Country", 
                              joinCode="NAME" )

#colourPalette <- RColorBrewer::brewer.pal(10,'Spectral')
colourPalette <- brewer.pal(N,"OrRd")

#plot the map
mapCountryData( myMap,
                nameColumnToPlot='confirmed_inc_count',
                catMethod='fixedWidth',
                colourPalette=colourPalette, 
                numCats=100)

covid_ag