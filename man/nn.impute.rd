\name{nn.impute}
\alias{nn.impute}

\title{Impute mean based on k nearest neighbours}

\description{The function uses the k nearest neighbours to calculate an average which is imputed.}

\usage{nn.impute(data = d, k = 5, na.rate = 0.5, normalise = TRUE)}

\arguments{
\item{data}{the data matrix containing NA's, with variables in columns}
\item{k}{the number of neighbours to use}
\item{na.rate}{The maximum na.rate tolerated}
\item{normalise}{if TRUE, the matrix will be normalised by column to unit variance}
}

\author{Per Broberg}

\value{A data matrix with imputed values}

\details{Variables not satisfying the na.rate condition will be excluded}

\references{Troyanskaya O, Cantor M, Sherlock G, Brown P, Hastie T, Tibshirani R, Botstein D, Altman RB: Missing value estimation methods for DNA microarrays, \emph{Bioinformatics} 2001 Jun;17(6):520-5} 

\keyword{multivariate}
