
\name{JT.test}
\alias{JT.test}
\title{Jonckheere-Terpstra trend test}

\description{The test is testing for a monotone trend in terms of the class parameter.
             The number of times that an individual of a higher class has a higher gene expression forms a basis for the inference.}

\usage{trendA <- JT.test(data = datsA, class = g, labels = c("NS", "HS", "COPD0", "COPD1", "COPD2"))}

\arguments{
\item{data}{the data with genes in rows and subjects in columns}
\item{class}{the column labels}
\item{labels}{the labels of the categories coded by class}
}

\value{a matrix with the columns
\item{pvalue}{the p-value for the two-sided test of no trend.}
\item{median1 ... mediann}{the medians for the n groups}
\item{trend}{the rank correlation with category}
}

\details{Assumes that groups are coded in incresing numerical order}

\author{Per Broberg}

\references{
Lehmann, EH (1975) \emph{Nonparametrics: Statistical Methods Based on Ranks} p. 233. Holden Day}

\keyword{nonparametric}
