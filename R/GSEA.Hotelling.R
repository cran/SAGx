GSEA.Hotelling <- function(probeset = probeset, X = x, Y = y, pway = kegg, cutoff = 5){
# probeset = probeset;X = data.A[,Day ==3]; Y = data.A[,Day == 21];pway = kegg.A[[3]];cutoff = 5
path.n = sapply(pway, length)
pway = pway[path.n > cutoff]
path.n = path.n[path.n > cutoff]
N = length(path.n)
m = ncol(X);n = ncol(Y)
result = vector(length = length(pway))
ps = vector(length = length(pway))

for(p in 1:N){
   X.p = X[probeset %in% pway[[p]],]
   Y.p = Y[probeset %in% pway[[p]],]
   diffs = rowMeans(X.p) - rowMeans(Y.p)
   U = sqrt(m+n)*diffs
   cc = cov(as.matrix(cbind(X.p,Y.p)))
result[p] = (m + n - nrow(X.p) - 1)*(t(U)%*%solve(cc)%*%U)/(nrow(X.p)*(m + n -2))   
ps[p] = 1-pf(result, nrow(X.p), m + n -nrow(X.p) - 1, ncp=0, lower.tail = TRUE, log.p = FALSE)
} 
list(statistica = qchisq(1-ps, 1), pvalue = ps)
}
