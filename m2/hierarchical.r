library(ggplot2)
# the four measures of irises, width &amp;amp; length + species
head(iris)
# remove the 5th column from the dataset which contains the name of the species -
# so there's no 'cheating'# from this point on 'irises' is our version of the
# origianl 'iris' data, so species is unknown..
irises <- iris[-5]
# and display
head(irises)

species_labels = iris[,5]

iris <- datasets::iris
iris2 <- iris[,-5]
species_labels <- iris[,5]
library(colorspace) # get nice colors
species_col <- rev(rainbow_hcl(3))[as.numeric(species_labels)]

# Plot a SPLOM:
pairs(iris2, col = species_col,
      lower.panel = NULL,
      cex.labels=2, pch=19, cex = 1.2)

# Add a legend
par(xpd = TRUE)
legend(x = 0.05, y = 0.4, cex = 2,
       legend = as.character(levels(species_labels)),
       fill = unique(species_col))
par(xpd = NA)