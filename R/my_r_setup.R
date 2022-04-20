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
      "broom",
      "caret",
      "corrplot",
      "dashboardthemes",
      "dtplyr",
      "usethis",
      "eurostat",
      "extrafont",
      "flexdashboard",
      "gapminder",
      "gganimate",
      "ggridges",
      "ggthemes",
      "glue",
      "haven",
      "here",
      "htmltools",
      "htmlwidgets",
      "httr",
      "jsonlite",
      "ISOweek",
      "janitor",
      "lavaan",
      "leaflet",
      "lm.beta",
      "lme4",
      "lubridate",
      "magrittr",
      "manipulateWidget",
      "markdown",
      "officer",
      "packrat",
      "psych",
      "QuantPsyc",
      "RColorBrewer",
      "rhandsontable",
      "rio",
      "rmarkdown",
      "rsthemes",
      "rstudioapi",
      "rvest",
      "scales",
      "shinydashboard",
      "shinyjs",
      "showtext",
      "slider",
      "svglite",
      "timevis",
      "viridis",
      "vroom",
      "waldo",
      "webshot",
      "taskscheduleR"
    )
  )

  #rstudioapi::getThemes()
  rstudioapi::applyTheme("One Dark {rsthemes}")
  #rstudioapi::applyTheme("Nord Polar Night Aurora {rsthemes}")
  #rstudioapi::applyTheme("Night Owl {rsthemes}")
  #rstudioapi::applyTheme("Material {rsthemes}")
  #rstudioapi::applyTheme("Material Ocean {rsthemes} ")
}
