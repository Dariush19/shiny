map("state", proj='bonne', param=45)
data(state)
text(
  mapproject(
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

library(ggplot2)
library(tidyverse)
library(forcats)
library(labeling)
library(ggmap)

install.packages("qmplot")
murder <- subset(crime, offense == "murder")
qmplot(lon, lat, 
       data = murder, 
       colour = I('red'),
       size = I(3),
       darken = .3
)