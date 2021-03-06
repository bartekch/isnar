#' (De)symmetrize square numeric matrix
#'
#' (De)symmetrize square binary matrix in various ways.
#'
#' Argument \code{mat} is to be a square numeric matrix. The way it is made
#' symmetric, or asymetric, depends on the value of the \code{rule} argument.
#' 
#' If \code{rule} is "upper" or "lower" then \code{mat} is made symmetric by
#' copying, respectively, upper triangle onto lower, or lower onto upper. The
#' value of \code{rule} specifies values of which triangle will stay in the
#' returned value.
#' 
#' If \code{rule} is "intdiv" then the off-diagonal values are distributed
#' approximately equally between the lower/upper triangles. If \code{r} is the
#' computed result, then \code{r[i,j]} will be equal to \code{(x[i,j] + x[j,i])
#' \%/\% 2} if \code{r[i,j]} is in the lower triangle. It will be equal to
#' \code{(x[i,j] + x[j,i]) \%/\% 2 + 1} if in the upper triangle.
#' 
#' If \code{rule} is "div" then the off-diagonal values are distributed equally
#' between the lower/upper triangles: as with "intdiv" but using normal
#' \code{/} division.
#'
#' @param mat square numeric matrix
#'
#' @param rule character, direction of copying, see Details
#'
#' @return A matrix: symmetrized version of \code{mat}.
#'
#' @seealso \code{\link{fold}}
#'
#' @example examples/symmetrize.R
#' @export
symmetrize <- function(mat, rule=c("upper", "lower", "div", "intdiv"))
{
    stopifnot(is.matrix(mat))
    rul <- match.arg(rule)
    rval <- mat
    switch( rul,
        upper = {
          rval[ lower.tri(mat) ] <- mat[upper.tri(mat)]
          rval
        },

        lower = {
          rval[ upper.tri(mat) ] <- mat[lower.tri(mat)]
          rval
        },

        intdiv = {
          mm <- mat + t(mat)
          rval <- mm %/% 2
          r <- mm[upper.tri(mm)] - 2 * rval[upper.tri(rval)]
          rval[upper.tri(rval)] <- rval[upper.tri(rval)] + r
          rval
        },

        div = {
          mm <- mat + t(mat)
          mm / 2
        },

        stop("unknown value for 'rule'")
        )
}
