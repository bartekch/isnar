% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/assort.R
\name{assort}
\alias{assort}
\alias{assort.default}
\alias{assort.igraph}
\alias{assort.table}
\title{Assortativity Coefficient}
\usage{
assort(object, ...)

\method{assort}{table}(object, ...)

\method{assort}{igraph}(object, vattr, ...)

\method{assort}{default}(object, ...)
}
\arguments{
\item{object}{R object, see available methods}

\item{...}{other arguments to/from other methods}

\item{vattr}{character, name of the vertex attribute for which the measure
is to be calculated}
}
\value{
Numeric value of the index.
}
\description{
Assortativity coefficient is a measure of segregation for social networks
due to Mark Newman (2002).
}
\details{
The measure evaluates the relative prevalence of within-group ties. It is
based on the contact layer of the mixing matrix.

Assortativity coefficient is 1 if all ties are within-group.
The minimum can be negative, but not less than -1, and depends on the
relative number of ties of nodes in different groups. If the network
conforms to "proportionate mixing", the coefficient is 0.

If \code{object} is a table it is treated as a mixing matrix.
Two-dimensional table is interpreted as a contact layer. Three-dimensional
table is interpreted as a full mixing matrix \eqn{m_{ghy}}{m[ghy]}
cross-classyfying all dyads, in which 'g' and 'h' correspond to group
membership of ego and alter respectively. Layers y=1 and y=2 are assumed to
be non-contact and contact layers respectively. In the 3-d case only
\code{g[,,2]} is used.

If \code{g} is an object of class "igraph" the measure is
calculated for the vertex attribute specified with \code{vattr}.

For any other classes, object \code{g} are coerced to a table and the
table method is called.
}
\examples{
assort(Wnet, "gender")
assort(EFnet, "type")

# value of 'assort' for full networks of different sizes
f <- function(n)
{
  gfull <- graph.full(n, directed=FALSE)
  V(gfull)$type <- rep(1:2, length=vcount(gfull))
  assort(gfull, "type")
}
set.seed(1)
x <- sort(sample(5:100, 25) * 2)
y <- sapply(x, f)
plot(x, y, type="o",
  xlab="Network size", ylab="Assortativity coefficient",
  main="Assortativity coef. for full networks of different sizes")
}
\references{
Newman, M. J. and Girvan, M. (2002) "Mixing patterns and community structure
in networks", arXiv:cond-mat/0210146v1

Newman, M. J. (2003) "Mixing patterns in networks" arXiv:cond-mat/0209450v2
}
\seealso{
Mixing matrices: \code{\link{mixingm}}

Other segregation.measures: \code{\link{coleman}},
  \code{\link{coleman.default}},
  \code{\link{coleman.igraph}},
  \code{\link{coleman.table}}; \code{\link{ei}},
  \code{\link{ei.default}}, \code{\link{ei.igraph}},
  \code{\link{ei.table}}; \code{\link{freeman}},
  \code{\link{freeman.default}},
  \code{\link{freeman.igraph}},
  \code{\link{freeman.table}}; \code{\link{gamix}},
  \code{\link{gamix.default}}, \code{\link{gamix.igraph}},
  \code{\link{gamix.table}}; \code{\link{orwg}},
  \code{\link{orwg.default}}, \code{\link{orwg.igraph}},
  \code{\link{orwg.table}}; \code{\link{smi}},
  \code{\link{smi.default}}, \code{\link{smi.igraph}},
  \code{\link{smi.table}}; \code{\link{ssi}}
}

