library(RBM)

input <- function(inputfile) {
  parameters <- read.table(inputfile, as.is=T);
  rownames(parameters) <- parameters[,1]
  trainfile <- toString(parameters["training", 2])
  iter <<- as.integer(parameters["iterations", 2])
  hidden <<- as.integer(parameters["hidden", 2])
  minibatch <<- as.integer(parameters["minibatch", 2])
  train <<- read.csv(trainfile)
  train <<- train[,-1]
}

run <- function() {
modelRBM <<- RBM(x = train, n.iter = iter, n.hidden = hidden, size.minibatch = minibatch)
}

output <- function(outputfile) {
write.csv(modelRBM$trained.weights, outputfile)
}
#print(modelRBM$trained.weights)
