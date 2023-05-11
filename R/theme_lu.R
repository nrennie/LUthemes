#' Theme for {ggplot2} plots
#' @param main_family Name of font family to use for most of the text in the
#' plot. Default "Roboto".
#' @param title_family Name of font family to use for title of the plot.
#' Default "Roboto Slab".
#' @param bg_colour Background colour of plot. Default "white".
#' @param text_colour Text colour in plot. Default "black".
#' @param base_size Base size of text. Default 13.
#' @export

theme_lu <- function(main_family = "Roboto",
                     title_family = "Roboto Slab",
                     bg_colour = "white",
                     text_colour = "black",
                     base_size = 13) {
  ggplot2::theme_minimal(
    base_family = main_family,
    base_size = base_size
  ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        family = title_family,
        colour = text_colour
      ),
      axis.text = ggplot2::element_text(
        margin = ggplot2::margin(t = 10, r = 5),
        colour = text_colour
      ),
      plot.background = ggplot2::element_rect(
        fill = bg_colour,
        colour = bg_colour
      ),
      panel.background = ggplot2::element_rect(
        fill = bg_colour,
        colour = bg_colour
      ),
      plot.margin = ggplot2::margin(10, 10, 10, 10)
    )
}
