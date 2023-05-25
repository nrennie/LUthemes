#' Set LU base R graphical parameters
#'
#' @param family Font used for all text elements except title. Default "Roboto".
#' @param font.main Font used for title. Default 2.
#' @param adj Alignment of text for title. Default 0.
#' @param mar Margins. Default \code{c(5, 3, 3, 2.5)}.
#' @param bty Axis lines. Default "n".
#' @param ... Additional arguments passed to \code{par}
#' @export

set_lu_par <- function(family = "Roboto",
                       font.main = 2,
                       adj = 0,
                       mar = c(5, 3, 3, 2.5),
                       bty = "n",
                       ...) {
  graphics::par(
    family = family,
    font.main = font.main,
    adj = adj,
    mar = mar,
    bty = bty,
    ...
  )
}
