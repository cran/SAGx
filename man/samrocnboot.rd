\name{samrocNboot}
\alias{samrocNboot}

\title{Calculate ROC curve based SAM statistic}

\description{A c-code version of samrocN. Calculation of the regularised t-statistic which minimises 
the false positive and false negative rates.}

\usage{samrocNboot(data=M,formula=~as.factor(g), contrast=c(0,1), N = c(50, 100, 200, 300), B=100, perc = 0.6, smooth=FALSE, w = 1, measure = "euclid")}

\arguments{
\item{data}{The data matrix}
\item{formula}{a linear model formula}
\item{contrast}{the contrast to be estimnated }
\item{N}{the size of top lists under consideration}
\item{B}{the number of bootstrap iterations}
\item{perc}{the largest eligible percentile of SE to be used as fudge factor}
\item{smooth}{if TRUE, the std will be estimated as a smooth function of expression level}
\item{w}{the relative weight of false positives}
\item{measure}{the goodness criterion}
}

\author{Per Broberg and Freja Vamborg}

\value{A list with components
\item{d}{the statistic for each probe set}
\item{diff}{The effect estimate, e.g. the mean difference between two groups}
\item{se}{the standard error}
\item{d0}{the bootstrapped values on the test statistic}
\item{p0}{the proportion unchanged genes}
\item{s0}{the regularising constant}
\item{pvalues}{the p-values}
\item{N}{The optimal toplist size}
\item{errors}{the estimated sum of false positive and false negative rates when selcted the gene and all higher ranking ones}
}

\details{The test statistic is based on the one in Tusher et al (2001):

\deqn{\frac{d = diff}{s_0+s}}{d = diff / (s_0 + s)}

where \eqn{diff} is a the estimate of a constrast, \eqn{s_0} is the regularizing constant 
and \eqn{s} the standard error.  At the heart of the method lies an estimate of the false negative and false positive rates. The
test is calibrated so that these are minimised. For calculation of \eqn{p}-values a bootstrap procedure is invoked. Further details are given in Broberg (2003).

The p-values are calculated through permuting the rows of the design matrix. NB This is not adequate for all linear models.

samrocNboot uses C-code to speed up the bootstrap loop. } 

\examples{
library(multtest)
#Loading required package: genefilter 
#Loading required package: survival 
#Loading required package: splines 
#Loading required package: reposTools 
data(golub)
 # This makes the expression data from Golub et al available
 # in the matrix golub, and the sample labels in the vector golub.cl
 
 samroc.res <- samrocNboot(data = golub, formula = ~as.factor(golub.cl))
#Warning message: 
#package 'modreg' has been merged into 'stats' 
 samroc.res$p0
#[1] 0.4776763
 samroc.res$s0
#  0 
 hist(samroc.res$pvalue)
 # many genes appear changed
}

\keyword{htest}

\references{
Tusher, V.G., Tibshirani, R., and Chu, G. (2001) Significance analysis of microarrays applied to
the ionizing radiation response. \emph{PNAS} Vol. 98, no.9, pp. 5116-5121 \cr

Broberg, P. (2002) Ranking genes with respect to differential expression , \url{http://genomebiology.com/2002/3/9/preprint/0007} \cr

Broberg. P: Statistical methods for ranking differentially expressed genes. Genome Biology 2003, 4:R41
\url{ http://genomebiology.com/2003/4/6/R41}


}
}
