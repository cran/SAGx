\name{GSEA.Hotelling}
\alias{GSEA.Hotelling}

\title{Gene Set Enrichment Analysis}

\description{Based on a list of gene sets, e.g. pathways, in terms Affymtrix identifiers, these
sets are ranked with respect to regulation in between two groups of chips.}

\usage{GSEA.Hotelling(probeset = probeset, X = x, Y = y, pway = kegg, cutoff = 5)}

\arguments{
\item{probeset}{the Affymetrix identifiers}
\item{X}{data for group 1}
\item{Y}{data for group 2}
\item{pway}{a list where each component contains a vector with probeset IDs}
\item{cutoff}{Gene sets with less than \emph{cutoff} members are excluded}
}

\author{Per Broberg}

\value{A list with the component score, pvalue, corr.pval.}

\note{Experimental function}

\references{
Yan Lu, Peng-Yuan Liu, Peng Xiao and Hong-Wen Deng : Hotelling's T2 multivariate profiling for detecting differential expression in microarrays, Bioinformatics, 2005, Vol.21, no.12
}

\keyword{multivariate}
