# library(SAGx)
permutation.t <- function (data = data, grp = grp, B = 1000, na.rate = 0.2){ 
# Author : PBG 12OCT04; modified 08APR05;modified 16NOV05
# data <- dats
# B <- 1000;na.rate <- 0.2
grps <- unique(grp)
output.dim <- nrow(data)
data1 <- data[,grp == grps[1]];n1 <- ncol(data1)
data2 <- data[,grp == grps[2]];n2 <- ncol(data2)

 mean.na <- function (x) {
    mean(x[!(is.na(x) | is.infinite(x))])
}

means1 <- apply(data1, 1, function(x) mean.na(x))
means2 <- apply(data2, 1, function(x) mean.na(x))

n.miss1 <- apply(data1, 1, function(x) sum(is.na(x)));perc1.na <- n.miss1/ncol(data1)
n.miss2 <- apply(data2, 1, function(x) sum(is.na(x)));perc2.na <- n.miss2/ncol(data2)
used.index <- apply(data.frame(perc1.na, perc2.na), 1, function(x) max(x[1], x[2]) <= na.rate)
data1 <- data1[used.index,];data2 <- data2[used.index,];n.miss1 <- n.miss1[used.index];n.miss2 <- n.miss2[used.index] 
n.miss <- n.miss1+n.miss2
tab.test <- table(n.miss1,n.miss2)
used <- which(tab.test > 0, arr.ind = TRUE)
g.used  <- NULL    
for(i in 1:nrow(used)){
g.temp <- c(rep(grps[1], n1 - as.numeric(rownames(tab.test)[used[i,1]])),rep(grps[2], n2 - as.numeric(colnames(tab.test)[used[i, 2]]))) 
g.used <- c(g.used, list(node = g.temp))
}



# create index set for variables with i missing

miss.pattern <- NULL
for(i in 1:dim(tab.test)[2]){
   for(j in 1:dim(tab.test)[1]){
      miss.pattern <- c(miss.pattern, list(indices = c(1:nrow(data1))[(n.miss1 == as.numeric(rownames(tab.test)[j]))&(n.miss2 == as.numeric(colnames(tab.test)[i]))]))

}}

# miss.pattern <- miss.pattern[used]

# Put data for these different index sets as matrices into a list

datasets <- NULL

for(i in 1:length(miss.pattern)){
    if(length(miss.pattern[[i]]) > 1) datasets <- c(datasets, list(node = as.matrix(t(apply(as.matrix(cbind(data1[unlist(miss.pattern[i]),],data2[unlist(miss.pattern[i]),])), 1, function(x) x[!is.na(x)])))))
#    if(length(miss.pattern[[i]]) == 1) datasets <- c(datasets, list(node = as.matrix(t(apply(as.matrix(t(c(data1[unlist(miss.pattern[i]),],data2[unlist(miss.pattern[i]),]))), 1, function(x) x[!is.na(x)])))))
    if(length(miss.pattern[[i]]) == 1) datasets <- c(datasets, list(node = as.matrix(t(apply(data.frame(t(data1[unlist(miss.pattern[i]),]),t(data2[unlist(miss.pattern[i]),])), 1, function(x) x[!is.na(x)])))))

 }


# statistic(cbind(data1,data2))

statistic <-  function(x, g.temp){
# x <- as.matrix(cbind(data1[unlist(miss.pattern[1]),],data2[unlist(miss.pattern[1]),]))
# x <- as.matrix(x[!is.na(x)])
dats1 <- as.matrix(x[,g.temp == grps[1]]);dats2 <- as.matrix(x[,g.temp == grps[2]])
n1 <- ncol(dats1);n2 <- ncol(dats2)
means1 <- c(rep(1/ncol(dats1), ncol(dats1))) %*% t(dats1)
means2 <- c(rep(1/ncol(dats2), ncol(dats2))) %*% t(dats2)
resid1 <- sweep(dats1, 1, means1)
resid2 <- sweep(dats2, 1, means2)    
var1 <- crossprod(c(rep(1, ncol(resid1))), t(resid1 * resid1))/(n1 - 1)
var2 <- crossprod(c(rep(1, ncol(resid2))), t(resid2 * resid2))/(n2 - 1)
(means1-means2)/sqrt(var1/n1+var2/n2)
}


obs.test <- vector(length = nrow(data1))

for(i in 1:length(miss.pattern)){
      obs.test[unlist(miss.pattern[i])] <- statistic(datasets[[i]], g.used[[i]])
}

permutation.dist <- matrix(nrow = length(unlist(miss.pattern)), ncol = B)


for(i in 1:B){
permutation <- sample(1:ncol(data))
   for(j in 1:length(miss.pattern)){
      permutation.dist[unlist(miss.pattern[j]),i] <- statistic(datasets[[j]][,permutation[permutation <= ncol(datasets[[j]])]], g.used[[j]]) 
   }
}

last.col <- B+1
p.value <- apply(data.frame(permutation.dist, obs.test), 1, function(x) sum(abs(x[-last.col]) >= abs(x[last.col])))

p.value <- (1 + p.value)/(B + 1)

output.data <- data.frame(c(rep(NA,output.dim)),means1,means2) 

output.data[c(1:output.dim)[used.index],1] <- p.value;colnames(output.data) <- c(paste("bootstrap p-value", grps[1],"vs",grps[2]), paste("Mean",grps[1]), paste("Mean",grps[2])) 

# output.data <- array(nrow = length(p.value), ncol = 3)

return(output.data)
}
