# The clustering index due to Calinski and Harabasz (1974) #

caha<-function(data,cluster){
library(sma)
stat.bwss(data,cluster)$bw*nrow(data)/(nrow(data)-length(table(cluster)))
}
