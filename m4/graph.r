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


==============================
  
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