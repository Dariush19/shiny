install.packages("igraph")
library(igraphdata) 
library(igraph)
data(karate) # load the built-in graph data
l <- layout.fruchterman.reingold(g,niter=500,area=vcount(g)^2.3,repulserad=vcount(g)^2.8)
plot(karate)

plot(karate, L)
?karate
V(karate)
E(karate)
get.adjacency(karate)

####
# Reproducible layout
set.seed(42)

# Now decorate, starting with labels and shapes
V(karate)$label <- sub("Actor ", "", V(karate)$name)
V(karate)$shape <- "circle"

# Differentiate two factions by color.
V(karate)[Faction == 1]$color <- "red"
V(karate)[Faction == 2]$color <- "dodgerblue"

# Vertex area proportional to vertex strength
# (i.e., total weight of incident edges).
V(karate)$size <- 4*sqrt(graph.strength(karate))
V(karate)$size2 <- V(karate)$size * .5

E(karate)$width <- E(karate)$weight

# Color edges by within/between faction.
F1 <- V(karate)[Faction==1]
F2 <- V(karate)[Faction==2]
E(karate)[ F1 %--% F1 ]$color <- "pink" # F1 to F1 i.e. internal
E(karate)[ F2 %--% F2 ]$color <- "lightblue"
E(karate)[ F1 %--% F2 ]$color <- "yellow"

# Offset vertex labels for smaller points (default = 0). # or make all the circles bigger...
V(karate)$label.dist <- ifelse(V(karate)$size >= 10, 0, 0.75)
l <- layout.kamada.kawai(karate)
plot(karate, layout=l)

###################### CENTRALITY
install.packages("sand")
library(sand) # Statistical Analysis of Network Data with R
library(sna) # Tools for Social Network Analysis
library(network)

A = get.adjacency(karate, sparse=FALSE) 

g = network::as.network.matrix(A) # make a matrix

par(mfrow=c(1,1))
sna::gplot.target(
  g, degree(g), main="Degree", 
  circ.lab = FALSE, # change to TRUE to see legend on concentric blue circles
  circ.col="skyblue", usearrows = FALSE, 
  vertex.col=c("blue", rep("red", 32), "yellow"),
  edge.col="darkgray"
)

###################################

par(mfrow=c(2,2))
par(mar=c(1.5, 1, 1, 0.5))

sna::gplot.target(
  g, degree(g), main="Degree", 
  circ.lab = FALSE, # change to TRUE to see legend on concentric blue circles
  circ.col="skyblue", usearrows = FALSE, 
  vertex.col=c("blue", rep("red", 32), "yellow"),
  edge.col="darkgray"
)

sna::gplot.target(g, closeness(g), main="Closeness",
                  circ.lab = FALSE, circ.col="skyblue",
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray")

sna::gplot.target(g, betweenness(g), main="Betweenness",
                  circ.lab = FALSE, circ.col="skyblue", 
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray")

sna::gplot.target(g, evcent(g), main="Eigenvalue",
                  circ.lab = FALSE, circ.col="skyblue",
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray")

displaylabels = TRUE

#######################################################
par(mfrow=c(2,2))

sna::gplot.target(
  g, degree(g), main="Degree", 
  circ.lab = FALSE, # change to TRUE to see legend on concentric blue circles
  circ.col="skyblue", usearrows = FALSE, 
  vertex.col=c("blue", rep("red", 32), "yellow"),
  edge.col="darkgray", displaylabels=TRUE
)

sna::gplot.target(g, closeness(g), main="Closeness",
                  circ.lab = FALSE, circ.col="skyblue",
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray", displaylabels=TRUE)

sna::gplot.target(g, betweenness(g), main="Betweenness",
                  circ.lab = FALSE, circ.col="skyblue", 
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray", displaylabels=TRUE)

sna::gplot.target(g, evcent(g), main="Eigenvalue",
                  circ.lab = FALSE, circ.col="skyblue",
                  usearrows = FALSE,
                  vertex.col=c("blue", rep("red", 32), "yellow"),
                  edge.col="darkgray", displaylabels=TRUE)

##################################

eb = edge.betweenness(karate) # metric on the edges


E(karate)[order (eb, decreasing = T)[1:3]]
# One by one
E(karate)[order (eb, decreasing = T)[1]] # 
E(karate)[order (eb, decreasing = T)[2]] #
E(karate)[order (eb, decreasing = T)[3]] #

## A simple example with a couple of actors
## The typical case is that these tables are read in from files....
actors <- data.frame(name=c("Alice", "Bob", "Cecil", "David",
                            "Esmeralda"),
                     age=c(48,33,45,34,21),
                     gender=c("F","M","F","M","F"))
relations <- data.frame(from=c("Bob", "Cecil", "Cecil", "David",
                               "David", "Esmeralda"),
                        to=c("Alice", "Bob", "Alice", "Alice", "Bob", "Alice"),
                        same.dept=c(FALSE,FALSE,TRUE,FALSE,FALSE,TRUE),
                        friendship=c(4,5,5,2,1,1), advice=c(4,5,5,4,2,3))
g <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
print(g, e=TRUE, v=TRUE)

## The opposite operation
as_data_frame(g, what="vertices")
as_data_frame(g, what="edges")
plot(g)


actors <- data.frame(name=c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"))
relations <- data.frame(from=c("A", "A", "B", "C", "D", "C", "D", "F", "G", "B", "E", "F", "G", "H", "H"),
                          to=c("C", "D", "C", "D", "E", "F", "G", "H", "H", "F", "G", "I", "J", "I", "J"))
g <- graph_from_data_frame(relations, directed=TRUE, vertices=actors)
print(g, e=TRUE, v=TRUE)

## The opposite operation
as_data_frame(g, what="vertices")
as_data_frame(g, what="edges")
plot(g)


