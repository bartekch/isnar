% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/mixingm.R
\name{mixingm}
\alias{mixingm}
\alias{mixingm.igraph}
\title{Network mixing matrix}
\usage{
mixingm(object, ...)

\method{mixingm}{igraph}(object, rattr, cattr = rattr, full = FALSE,
  directed = is.directed(object), loops = any(is.loop(object)), ...)
}
\arguments{
\item{object}{R object, see Details for available methods}

\item{...}{other arguments passed to/from other methods}

\item{rattr}{name of the vertex attribute or an attribute itself as a
vector. If \code{cattr} is not NULL, \code{rattr} is used for rows of the
resulting mixing matrix.}

\item{cattr}{name of the vertex attribute or an attribute itself as a
vector. If supplied, used for columns in the mixing matrix.}

\item{full}{logical, whether two- or three-dimensional mixing matrix
should be returned.}

\item{directed}{logical, whether the network is directed. By default,
directedness of the network is determined with
\code{\link[igraph]{is.directed}}.}

\item{loops}{logical, whether loops are allowed. By default it is TRUE
whenever there is at least one loop in \code{object}.}
}
\value{
Depending on \code{full} argument a two- or three-dimensional array
crossclassifying connected or all dyads in \code{object}.

For undirected network and if \code{foldit} is TRUE (default), the matrix is
folded onto the upper triangle (entries in lower triangle are 0).
}
\description{
Creating network mixing matrices.
}
\details{
Network mixing matrix is, traditionally, a two-dimensional
cross-classification of edges depending on the values of a specified vertex
attribute for tie sender and tie receiver. It is an important tool
for assessing network homophily or segregation.

Let \eqn{G} be the number of distinct values of the vertex attribute in
question.  We may say that we have \eqn{G} mutually exclusive groups in the
network.  The mixing matrix is a \eqn{G \times G}{GxG} matrix such that
\eqn{m_{ij}}{m[ij]} is the number of ties send by vertices in group \eqn{i}
to vertices in group \eqn{j}. The diagonal of that matrix is of special
interest as, say, \eqn{m_{ii}}{m[ii]} is the number of ties \emph{within}
group \eqn{i}.

A full mixing matrix is a three-dimensional array that cross-classifies
\emph{all} network \emph{dyads} depending on:
\enumerate{
\item{the value of the vertex attribute for tie sender}
\item{the value of the vertex attribute for tie receiver}
\item{the status of the dyad, i.e. whether it is connected or not}
}
The two-dimensional version is a so-called "contact layer"
of the three-dimensional version.

If \code{object} is of class "igraph," mixing matrix is created for the
network in \code{object} based on vertex attributes supplied in arguments
\code{rattr} and optionally \code{cattr}.

If only \code{rattr} is specified (or, equivalently, \code{rattr} and
\code{cattr} are identical), the result will be a mixing matrix \eqn{G
\times G} if \code{full} is \code{FALSE} or \eqn{G \times G \times 2}{GxGx2}
if \code{full} is \code{TRUE}. Where \eqn{G} is the number of categories of
vertex attribute specified by \code{rattr}.

If \code{rattr} and \code{cattr} can be used to specify different vertex
attributes for tie sender and tie receiver.
}
\examples{
# some directed network
net <- graph(c(1,2, 1,3, 2,3,  4,5,  1,4, 1,5, 4,2, 5,3))
V(net)$type <- c(1,1,1, 2,2)

mixingm(net, "type")
mixingm(net, "type", full=TRUE)

# as undirected
mixingm( as.undirected(net), "type")
mixingm(net, "type")
mixingm(net, "type", full=TRUE)
}

