# load termDocMatrix
load("E:\\Personal_Files\\Dariush\\monash\\visual\\m4\\termDocMatrix.rdata")
# inspect part of the matrix
termDocMatrix[5:10,1:20]
# Transform Data into an Adjacency Matrix
# change it to a Boolean matrix
termDocMatrix[termDocMatrix>=1] <- 1
# transform into a term-term adjacency matrix
termMatrix <- termDocMatrix %*% t(termDocMatrix)
# inspect terms numbered 5 to 10
termMatrix[5:10,5:10]

library(igraph)

g <- graph.adjacency(termMatrix, weighted=T, mode = "undirected")

# remove loops
g <- simplify(g)

# set labels of vertices
V(g)$label <- V(g)$name

# set seed to make the layout reproducible
set.seed(3952)
layout1 <- layout.fruchterman.reingold(g)
plot(g, layout=layout1)
# plot(g, layout=layout.kamada.kawai)