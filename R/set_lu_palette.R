#' Set LU base R plotting palette
#'
#' @param palette Name of palette. See \code{names(LUthemes::lu_colours)}. Run
#' \code{palette("default")} to reset.
#' @export

set_lu_palette <- function(palette) {
  palette_choice <- lu_colours[[palette]]
  if (is.null(palette_choice) || is.numeric(palette)) {
    stop("Palette does not exist. Use names(LUthemes::lu_colours) to find valid palette.")
  }
  grDevices::palette(palette_choice[[1]])
}