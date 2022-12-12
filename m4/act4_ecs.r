library(igraph)
g <- graph.formula(1-2, 1-3, 2-3, 2-4)
plot(g)
V(g)
E(g)
diameter(g)
get.adjacency(g)
V(g)$name <- c("Adam", "Bob", "Con", "Doug")

plot(g, vertex.label = V(g)$name) # add labels
get.adjacency(g)

dg <- graph.formula(1-+2, 1-+3, 2-+3, 2-+4) 
plot(dg)

dg <- graph.formula(1-+2, 2-+1) 
plot(dg)

V(dg)$name <- c("Adam", "Bob", "Con", "Doug") # names!
plot(dg, vertex.label = V(dg)$name)

is.weighted(dg)

wdg <- dg
E(wdg)$weights <- runif(ecount(wdg)) * 1000
plot(wdg, vertex.label = V(wdg)$name, edge.width=E(wdg)$weights)

plot(wdg, vertex.label = V(wdg)$name, edge.width=E(wdg)$weights / 100) 

plot(wdg, vertex.label = V(wdg)$name, edge.width=E(wdg)$weights / 100, layout = layout.star)




G <- graph( c(1,2,1,3,1,4,3,4,3,5,5,6,6,7,7,8,8,9,3,8,5,8), directed = F )
# Assign attributes to the graph
G$name <- "Change my layout, I dare you"
# Assign attributes to the graph's vertices
V(G)$name <- toupper(letters[1:9])
V(G)$color <- sample(rainbow(9),9,replace=FALSE)
# Assign attributes to the edges
E(G)$weight <- runif(length(E(G)),.5,4)
# Plot the graph
plot(G, layout = layout.auto,
     main = G$name,
     vertex.label = V(G)$name,
     vertex.size = 25,
     vertex.color= V(G)$color,
     vertex.frame.color= "white",
     vertex.label.color = "white",
     vertex.label.family = "sans",
     edge.width=E(G)$weight,
     edge.color="black")


par(mfrow=c(2,2)) # 2 x 2 display
g <- graph.full(n=5, directed = FALSE, loops = FALSE)
plot(g)
g <- graph.star(n=5, mode="out")
plot(g)
g <- graph.star(n=5, mode="in")
plot(g)
g = graph.ring(n=5)
plot(g)





par(mfrow=c(1,1))
g <- graph.full(5)
E(g)$weight <- runif(ecount(g)) # random weights, run again for different result
E(g)$width <- 1
E(g)$color <- "red"
E(g)[ weight < 0.5 ]$width <- 2
E(g)[ weight < 0.5 ]$color <- "blue"
plot(g, layout=layout.circle, edge.width=E(g)$width, edge.color= E(g)$color)
E(g)$weight
g1 <- make_star(5)
g2 <- induced_subgraph(g1, 1:2) # select vertices
plot(g2)
g3 <- subgraph.edges(g1, 1:4, TRUE) # select edges
plot(g3)
par(mfrow=c(1,3))
21
plot(g1)
plot(g2)
plot(g3)




#========Analysis of network data===========
library(igraphdata)
library(igraph)
d <- data(karate) # load the built-in graph data
colnames(d)

#column_names(karate)
?karate
V(karate)
E(karate)
get.adjacency(karate)
data(karate) # load the built-in graph data
?karate
V(karate)
E(karate)
get.adjacency(karate)  


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

# Weight edges by number of common activities
E(karate)$width <- E(karate)$weight

# Color edges by within/between faction.
F1 <- V(karate)[Faction==1]
F2 <- V(karate)[Faction==2]
E(karate)[ F1 %--% F1 ]$color <- "pink" # F1 to F1 i.e. internal
E(karate)[ F2 %--% F2 ]$color <- "lightblue"
E(karate)[ F1 %--% F2 ]$color <- "yellow"
V(karate)$label.dist <- ifelse(V(karate)$size >= 10, 0, 0.75)
l <- layout.kamada.kawai(karate)
plot(karate, layout=l)
V(karate)
F1


#======network data=============
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


## ############################################
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
                               
# ###########
eb = edge.betweenness(karate) # metric on the edges


E(karate)[order (eb, decreasing = T)[1:3]]
# One by one
E(karate)[order (eb, decreasing = T)[1]] #
E(karate)[order (eb, decreasing = T)[2]] #
E(karate)[order (eb, decreasing = T)[3]] #

par(mfrow=c(1,1))
G <- graph.adjacency(A)
plot(G) # actually it is hard to see
plot(G, vertex.size=5, layout = layout.davidson.harel) # still hard to see


par(mfrow=c(2,1)) # make two plots up and down
par(mar=c(0.5, 1, 1, 1))

kk.layout <- layout.kamada.kawai(G) # make a consistent layout for the graphs
# make the left plot
com <- edge.betweenness.community(G)
V(G)$color <- com$membership+1
plot(G, vertex.label.dist=.75,layout=kk.layout,
     main="Edge-Betweenness Communities",
     edge.arrow.size=0.25)
# make the right plot
com <- walktrap.community(G)
V(G)$color <- com$membership+1
plot(G, vertex.label.dist = .75, layout=kk.layout,
     main="Walktrap Communities",
     edge.arrow.size=0.25)