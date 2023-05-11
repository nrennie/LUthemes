.onLoad <- function(libname, pkgname) {
  sysfonts::font_add(
    family = "Roboto",
    regular = system.file("fonts", "Roboto", "Roboto-Regular.ttf", package = "LUthemes"),
    italic = system.file("fonts", "Roboto", "Roboto-Italic.ttf", package = "LUthemes"),
    bold = system.file("fonts", "Roboto", "Roboto-Bold.ttf", package = "LUthemes")
  )
  sysfonts::font_add(
    family = "Roboto Slab",
    regular = system.file("fonts", "RobotoSlab", "RobotoSlab-Regular.ttf", package = "LUthemes"),
    bold = system.file("fonts", "RobotoSlab", "RobotoSlab-Bold.ttf", package = "LUthemes")
  )
  showtext::showtext_auto()
}
