GSEA.t2 <- function(probeset = probeset, X = x, Y = y, pway = kegg, cutoff = 5){
# probeset = probeset;X = data.A[,Day ==3]; Y = data.A[,Day == 21];pway = kegg.A[[3]];cutoff = 5
path.n = sapply(pway, length)
pway = pway[path.n > cutoff]
path.n = path.n[path.n > cutoff]
N = length(path.n)
m = ncol(X);n = ncol(Y)
result = vector(length = length(pway))

for(p in 1:N){
   X.p = X[probeset %in% pway[[p]],]
   Y.p = Y[probeset %in% pway[[p]],]
   U = sqrt(m+n)*(rowMeans(X.p) - rowMeans(Y.p))
    output <- .C("ucov", as.double(X.p), as.double(Y.p), 
        as.integer(nrow(X.p)), as.integer(ncol(X.p)), as.integer(ncol(Y.p)), 
        S1 = as.double(rep(0,nrow(X.p) * nrow(X.p))), 
        S2 = as.double(rep(0, nrow(X.p) * nrow(X.p))), PACKAGE = "SAGx")
S1 = matrix(output$S1, ncol = nrow(X.p))
S2 = matrix(output$S2, ncol = nrow(X.p))
mat2TeX(S1);mat2TeX(S2)
cc = (m +n)*(S1/(m*m*n*(n-1))+S2/(n*n*m*(m - 1)))
cc = (cc + t(cc))/2 
result[p] = t(U)%*%solve(cc)%*%U   
} 

result

# pf(q, df1, df2, ncp=0, lower.tail = TRUE, log.p = FALSE)


}
