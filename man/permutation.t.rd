\name{permutation.t}
\alias{permutation.t}
\title{bootstrap p-value for matrix with variables in rows and with arbitrary missing structure.}

\description{Calculates bootstrap p-values corresponding to a Welch's t-test.}

\usage{permutation.t(data = data, grp = grp, B = 1000, na.rate = 0.2)}

\arguments{
\item{data}{data matrix with variables in columns}
\item{grp}{vector that holds the class labels}
\item{B}{number of bootstrap iterations}
\item{na.rate}{threshold for the proportion missing tolerated in any group}
}

\examples{
\dontrun{
p.vals <- permutation.t(data = clinical.data,grp = grp, B = 10000, na.rate = 0.1) 
}
}

\keyword{nonparametric}
