# re-written 29NOV02, bug fix 30JUN04, bug fix 03DEC04                #

 nn.impute <- function (data = d, k = 5, na.rate = 0.5, normalise = TRUE) {
    if(sum(is.na(data)) == 0) stop("No missing data")
    narat <- apply(data, 2, function(x) mean(is.na(x)))
    data <- data[, narat < na.rate]
    library(stats)
    ifelse(normalise,avst <- as.matrix(dist(data)),avst <- as.matrix(dist(scale(data,center=FALSE))))
    indices <- which(is.na(data), arr.ind = TRUE)
    for (i in 1:length(unique(indices[,1]))) {
        close <- which(rank(avst[indices[i, 1], ]) < k)
        data[indices[i, 1], indices[i, 2]] <- mean.na(data[close, 
            indices[i, 2]])
    }
    data
}
