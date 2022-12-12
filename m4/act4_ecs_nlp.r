library("tm") # for text mining
library("SnowballC") # for text stemming
library("wordcloud")
library("RColorBrewer")
# Read the text file
filePath <- "E:\\Personal_Files\\Dariush\\monash\\visual\\m4\\WordCloud.txt"
text <-readLines(filePath) # Load the data as a corpus and save a copy as 'input'
input <- Corpus(VectorSource(text))
docs <- input
head(docs,40)
inspect(docs)

dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(
  rowSums(m),
  decreasing = TRUE
)
d <- data.frame(
  words = names(v),
  freq = v
)
nrow(d) # how many 'words'
tail(d,10) # look at top 10

wordcloud(
  words = d$words,
  freq = d$freq,
  min.freq = 1,
  max.words = 200,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8,"Dark2")
)

stopwords("english")
stopwords("french") # c'est la vie...
stopwords("romanian") # why not...
stopwords("swahili") # no... boo



docs <- tm_map(docs, tolower) # make all letters to lowercase
docs <- tm_map(docs, removeWords, stopwords("english"))
# this is destructive, you may need to start again or use the copy 'input'
# and process again
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(words = names(v), freq=v)
nrow(d)
head(d, 10)
# and display again, 'the' should be gone
set.seed(1234)
wordcloud(
  words = d$words, freq = d$freq, min.freq = 1,
  max.words=200, random.order=FALSE, rot.per=0.35,
  colors=brewer.pal(8, "Dark2")
)

?TermDocumentMatrix


stemCompletion(c("visualis","techniqu","identifi"), d$words)
stemCompletion(c("visualis","techniqu","identifi"), d$words, type = "prevalent")
stemCompletion(c("visualis","techniqu","identifi"), d$words, type = "random")

stemCompletion(c("visualis"), d$words)

docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(words = names(v),freq=v)
nrow(d)
head(d, 10)
set.seed(1234)
wordcloud(
  words = d$words, freq = d$freq, min.freq = 1,
  max.words=200, random.order=FALSE, rot.per=0.35,
  colors=brewer.pal(8, "Dark2")
)

#  ##########

# stemming first, input is original
docs <- tm_map(input, stemDocument, language = "english")
# docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(words = names(v),freq=v)
nrow(d)
head(d, 10)
set.seed(1234)
wordcloud(words = d$words, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))
# Remove common English stopwords (e.g. 'the')
docs <- tm_map(docs, removeWords, stopwords("english"))
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(words = names(v),freq=v)
nrow(d)
head(d, 10)
set.seed(1234)
wordcloud(words = d$words, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "Dark2"))

########################

require(httr) # may have to install these two
require(XML)
lemmatize <- function(wordlist) {
  get.lemma <- function(word, url) {
    response <- GET(url,query=list(spelling=word,standardize="",
                                   wordClass="",wordClass2="",
                                   corpusConfig="ncf", # Nineteenth Century Fiction
                                   media="xml"))
    content <- httr::content(response, type="text/plain")
    xml <- xmlInternalTreeParse(content)
    return(xmlValue(xml["//lemma"][[1]]))
  }
  # here's the code
  url <- "http://classify.at.northwestern.edu/maserver/lemmatizer"
  return(sapply(wordlist, get.lemma, url=url))
}
words <- c("is","am","was","are", "born")
lemmatize(words)
# is am was are
# "be" "be" "be" "be"
# 'to be'
words <- c(
  "walk","walking","walked","walk",
  "Walker", "walks", "Walker Texas Ranger",
  "sidewalk"
)
lemmatize(words)
words <- c("Walker Texas Ranger","range","ranger","ranged","rangy","Ranger")

lemmatize(words)


######################

# load termDocMatrix
load("termDocMatrix.rdata")

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
plot(g, layout=layout.kamada.kawai)