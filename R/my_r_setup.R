#' My R-Setup
#'
#' Installs preferred packages and sets a RStudio Theme
#'
#' @author Lukas Feuer
#' @return
#' @export
#'
my_r_setup <- function() {
  utils::install.packages(
    c(
      "tidyverse",
      "fpp3",
      "shiny",
      "box",
      "readxl",
      "plotly",
      "data.table",
      "devtools",
      "dplyr",
      "DT",
      "dygraphs",
      "xts",
      "PerformanceAnalytics",
      "airports",
      "apaTables",
      "bayesplot",
      "blastula",
      "blogdown",
      "broom",
      #"Cairo",
      "caret",
      "corrplot",
      "countrycode",
      "dashboardthemes",
      "dtplyr",
      "usethis",
      "eurostat",
      "extrafont",
      "flexdashboard",
      "fontawesome",
      "fs",
      "gapminder",
      "GGally",
      "gganimate",
      "ggrepel",
      "ggridges",
      "ggthemes",
      "glue",
      "haven",
      "here",
      "Hmisc",
      "htmlTable",
      "htmltools",
      "htmlwidgets",
      "httr",
      "imputeTS",
      "jsonlite",
      "ISOweek",
      "janitor",
      "kableExtra",
      #"keras",
      "knitr",
      "lavaan",
      "leaflet",
      "lm.beta",
      "lme4",
      "lobstr",
      "lubridate",
      #"magick",
      "magrittr",
      "manipulateWidget",
      "markdown",
      "MVN",
      "nycflights13",
      "officer",
      "packrat",
      "pastecs",
      "pdftools",
      "profvis",
      "psych",
      "quantmod",
      "questionr",
      "QuantPsyc",
      "RColorBrewer",
      "rhandsontable",
      "rio",
      "rmarkdown",
      "roxygen2",
      "rsthemes",
      "rstudioapi",
      "rvest",
      "sass",
      "scales",
      "shinydashboard",
      "shinyjs",
      "showtext",
      "slider",
      "svglite",
      #"tensorflow",
      #"tesseract",
      "testthat",
      "timevis",
      #"tinytex",
      "usethis",
      #"viridis",
      "viridisLite",
      "vroom",
      "waldo",
      "webshot",
      "whisker",
      #"wordcloud2",
      "XML",
      "xml2",
      "taskscheduleR"
    )
  )

  #rstudioapi::getThemes()
  rstudioapi::applyTheme("One Dark {rsthemes}")
  #rstudioapi::applyTheme("Nord Polar Night Aurora {rsthemes}")
  #rstudioapi::applyTheme("Night Owl {rsthemes}")
  #rstudioapi::applyTheme("Material {rsthemes}")
  #rstudioapi::applyTheme("Material Ocean {rsthemes} ")

  message(paste0(
    "---- Please also visit and install: ---------------",
    "\n https://github.com/nvbn/thefuck",
    "\n test"
  ))
}



# TODO
#   log for failed package installations
#   --> write a custom function that maps over the list
#   --> try?
#
#   print(list("packages installed successful),
#         list("packages failed to install + errormessages"))
#         --> always install dependencies
#
