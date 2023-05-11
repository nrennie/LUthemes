.onLoad <- function(libname, pkgname) {
  sysfonts::font_add_google("Roboto", "Roboto")
  sysfonts::font_add_google("Roboto Slab", "Roboto Slab")
  showtext::showtext_auto()
}
