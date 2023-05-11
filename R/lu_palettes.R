#' List of colours.
#'
#' Complete list of palettes.
#' Use names(lu_colours) to return all palette names.
#' @export
lu_colours <- list(
  seq_red = list(c(
    "#EFCECF", "#E09E9F", "#D06E6F",
    "#C13E3F", "#B20E10", "#8E0B0C",
    "#6A0809", "#470506", "#230203"
  )),
  seq_grey = list(c(
    "#4D4D4D", "#6F6F6F", "#888888",
    "#9D9D9D", "#AEAEAE", "#BEBEBE",
    "#CCCCCC", "#D9D9D9", "#E6E6E6"
  )),
  muted_qual = list(c(
    "#7faabe", "#A4769A", "#C4DAE5",
    "#F9A98E", "#75BF9A", "#c26763",
    "#869978", "#e1ab6c", "#324147",
    "#bab6a2", "#006382", "#8A3E65",
    "#48B6AD", "#FF7372", "#008375",
    "#64606c", "#557869", "#e3cb8b",
    "#81B8BB"
  ))
)

#' Define global colours
#' @export
lu_red <- c("#b20e10")

#' Define global colours
#' @export
lu_light_grey <- c("#bec0c2")

#' Define global colours
#' @export
lu_dark_grey <- c("#555656")

#' lu palettes
#' Generates the colour palettes
#' @param palette_name Name of Palette.
#' @param n Number of desired colors. If number of requested colors is
#' beyond the scope of the palette, colours are automatically interpolated.
#' @param type The type of palette. One of c("discrete", "continuous").
#' @return A vector of colors.
#' @export
lu_palettes <- function(palette_name,
                        n,
                        type = c("discrete", "continuous")) {
  palette <- lu_colours[[palette_name]][[1]]
  if (missing(n)) {
    n <- length(palette)
  }
  type <- match.arg(type)
  out <- switch(type,
    continuous = grDevices::colorRampPalette(palette)(n),
    discrete = palette[1:n]
  )
  structure(out,
    palette_name = palette_name,
    class = "palette"
  )
}


# Function for printing palette
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- graphics::par(mar = c(0, 0, 0, 0))
  on.exit(graphics::par(old))
  graphics::image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )
  graphics::rect(0, 0.92, n + 1, 1.08,
    col = grDevices::rgb(0, 0, 0, 0.6),
    border = NA
  )
  graphics::text((n + 1) / 2, 1,
    labels = attr(x, "palette_name"),
    cex = 1.5,
    family = "sans",
    col = grDevices::rgb(1, 1, 1, 1)
  )
}

#' Function for printing all palettes
#' @return A plot of all available palettes
#' @export
view_all_palettes <- function() {
  graphics::par(mfrow = c(ceiling(length(names(lu_colours)) / 2), 2))
  purrr::map(.x = names(lu_colours), .f = ~ print(lu_palettes(.x)))
  graphics::par(mfrow = c(1, 1))
}

#' Function to change colours in ggplot for discrete variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_colour_lu_d <- function(palette_name, ...) {
  ggplot2::scale_colour_manual(values = lu_palettes(palette_name,
    type = "discrete"
  ), ...)
}

#' Function to change colours in ggplot for discrete variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_manual}
#' @export
scale_color_lu_d <- scale_colour_lu_d


#' Function to change fill in ggplot for discrete variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_fill_manual}
#' @export
scale_fill_lu_d <- function(palette_name, ...) {
  ggplot2::scale_fill_manual(values = lu_palettes(palette_name,
    type = "discrete"
  ), ...)
}

#' Function to change colours in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_colour_lu_c <- function(palette_name, ...) {
  ggplot2::scale_colour_gradientn(colours = lu_palettes(
    palette_name = palette_name,
    type = "continuous"
  ), ...)
}

#' Function to change colours in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_colour_gradientn}
#' @export
scale_color_lu_c <- scale_colour_lu_c

#' Function to change fill in ggplot for continuous variables
#' @param palette_name Name of Palette.
#' @param ... other arguments to be passed to \code{scale_fill_gradientn}
#' @export
scale_fill_lu_c <- function(palette_name, ...) {
  ggplot2::scale_fill_gradientn(colours = lu_palettes(
    palette_name = palette_name,
    type = "continuous"
  ), ...)
}
