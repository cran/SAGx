\name{caha}
\alias{caha}

\title{Clustering Goodness measured by the Calinski-Harabasz index}

\description{Calculates a goodness of clustering measure based the ratio of between to within sum squares:
\deqn{caha=\frac{BSS/(n-k)}{WSS/n}}{%
      caha=BSS*n/[WSS*(n-k)]}
}

\usage{caha(data,cluster)}

\arguments{
\item{data}{The data matrix}
\item{cluster}{a vector descibing the cluster memberships consecutive numbers.}
}

\author{Per Broberg}

\value{The Calinski-Harabasz index}

\detail{ 
caha calls the sma function \code{stat.bwss}.
}

\references{
Calinski, R.B. and Harabasz, J. (1974) A dendrite method for cluster analysis, 
\emph{Communications in statistics} 3, 1-27
}

\keyword{multivariate}
