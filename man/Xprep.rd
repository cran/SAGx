\name{Xprep}
\alias{Xprep}

\title{Calculation of input to stat.bayesian starting from linear model}

\description{The function fits a linear model to a microarray data matrix.}

\usage{Xprep(indata=M, formula=~as.factor(g), contrast=c(0,1), design=NULL,Vars=NULL)}

\arguments{
\item{indata}{The data matrix}
\item{formula}{a linear model formula in the lm format}
\item{contrast}{a vector defining the contrast of interest}
\item{design}{the design matrix}
\item{Vars}{if not null the variance of the se is estimated through jacknife.}
}

\author{Per Broberg}

\value{a list with the entries 
\item{Mbar}{estimate of the contrast}
\item{Vest}{the error variance}
\item{k}{inverse of the scale factor turning Vest into a standard error}
\item{f}{the degrees of freedom of Vest}
\item{design}{the design matrix}
\item{Varse}{The variance of the standard error}
}
\details{As of v1.5 the code has been improved in terms of speed and takes advantage
of built-in R functions. This incereases the efficiency of e.g. samroc.}
}

\keyword{models}
