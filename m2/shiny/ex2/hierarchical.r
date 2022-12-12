library(ggplot2)
# the four measures of irises, width &amp;amp; length + species
head(iris)
# remove the 5th column from the dataset which contains the name of the species - 
# so there's no 'cheating'# from this point on 'irises' is our version of the 
# origianl 'iris' data, so species is unknown..
irises <- iris[-5]
# and display
head(irises)
# get the species names
species_labels = iris[,5] 
# a library with nice colors, install it if you do not have
library(colorspace) 
# get a color for each record according to its specie
species_col = rev(rainbow_hcl(3))[as.numeric(species_labels)] 

pairs(irises, col = species_col,
      lower.panel = NULL,
      cex.labels=2, pch=19, cex = 1.2)

par(xpd = TRUE)
legend(x = 0.05, y = 0.4, cex = 2,
       legend = as.character(levels(species_labels)),
       fill = unique(species_col))
par(xpd = NA)

fit <- kmeans(irises, 3, nstart = 25) # 3 clusters, kinda cheating, try 2, or 4 (or 1)
fit

df <- data.frame(irises)
df$cluster <- factor(fit$cluster)

ggplot(data = df, aes(
  x = Sepal.Length, y = Petal.Length, color = cluster
)) + geom_point()

ggplot(data = iris, aes(
  x = Sepal.Length, y = Petal.Length, color = Species)
) + geom_point()