library(ggplot2)
# the four measures of irises, width &amp;amp; length + species
head(iris)
unique(iris$Species)
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
head(species_col)

pairs(irises, col = species_col,
#lower.panel = NULL,
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


# ##### Ex 6.2
Names = c("Mike Hussey", "Aaron Finch", "Brad Hogg", "Steve Smith", 
          "George Bailey", "Mitchell Johnson", "Shaun Marsh", "Glenn Maxwell", 
          "Pat Cummins", "Mitchell Starc", "David Warner")
# and check length
#length(Names)

Ages = c(39,28,44,25,32,33,31,26,22,25,28)
#length(ages)
IPLSals = c(310,662,103,828,672,1340,455,1240,207,1030,1140)

crickets = data.frame(Names, Ages, IPLSals)
crickets # and display
crickets = crickets[-1]

clusters = 2  # how many clusters?? Don't know, try 2
fit  <- kmeans(crickets, clusters, nstart = 25)
# is this data even suitable for clustering, is there enough?
fit
fit$cluster
# df <- data.frame(df)
crickets$cluster <- factor(fit$cluster)

crickets$cluster <- factor(fit$cluster)
ggplot(data = crickets, aes(x = IPLSals, y = Ages, color = cluster)) + geom_point()

ggplot(data = crickets, aes(y = IPLSals, x = Ages, color = cluster)) + geom_point() 


############################# 6.3
d <- dist(as.matrix(crickets))  # distance matrix, how close, or far apart are the data
d 
crickets
dist(crickets)

hcc <- hclust(d)
hcc
plot(hcc)

plot(hcc, labels = Names) 
dist(crickets)


par(mfrow = c(2,2))
plot(hclust(d,"com"), labels = Names) 
plot(hclust(d,"av"), labels = Names) 
plot(hclust(d,"sin"), labels = Names) 
# you just have to try a mcquitty...
plot(hclust(d,"mcq"), labels = Names) 


library(colorspace)
library(dendextend)
par(mfrow=c(1,1))
# get colors from thrid-party library
cols <- rainbow_hcl(3) 
hcc <- as.dendrogram(hcc)
hcc <- color_branches(hcc, 3)
plot(hcc)


par(mfrow=c(1,1))
m_dist <- dist(iris, diag = FALSE)
#  or just "com"
m_hclust <- hclust(m_dist, method = "complete") 
plot(m_hclust)

###################################


k = 3
cols <- rainbow_hcl(k)
dend <- as.dendrogram(m_hclust)
dend <- color_branches(dend, k = k)

plot(dend)

labels_dend <- labels(dend)

# cut tree to different clusters
groups <- cutree(dend, k=k, order_clusters_as_data = FALSE) 
dends <- list()
for(i in 1:k) {
  labels_to_keep <- labels_dend[i != groups]
  dends[[i]] <- prune(dend, labels_to_keep)
}

par(mfrow = c(1,3))
for(i in 1:k) { 
  plot(dends[[i]], 
       main = paste0("Tree number ", i))
}