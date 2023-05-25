#' Set LU base R graphical parameters
#'
#' @param family Font used for all text elements. Default "Roboto".
#' @param adj Alignment of text for title. Default 0.
#' @param mar Margins. Default \code{c(5, 3, 3, 2.5)}.
#' @param bty Axis lines. Default "n".
#' @param ... Additional arguments passed to \code{par}
#' @export

set_lu_par <- function(family = "Roboto",
                       adj = 0,
                       mar = c(5, 3, 3, 2.5),
                       bty = "n",
                       ...) {
  graphics::par(
    family = family,
    adj = adj,
    mar = mar,
    bty = bty,
    ...
  )
}
