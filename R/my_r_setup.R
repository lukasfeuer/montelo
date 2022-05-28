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
    dependencies = TRUE,
    type = "source",
    pkgs = c(
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
      "corrr", # tidy correlations
      "corrplot",
      "countrycode",
      "dashboardthemes",
      "destatiscleanr",
      "dtplyr",
      "usethis",
      "errorist",
      "eurostat",
      "extrafont",
      "flexdashboard",
      "fontawesome",
      "fortunes",
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
      "installr",
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
      "microbenchmark",
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
      "rstudio.prefs",
      "rvest",
      "sass",
      "scales",
      "searcher",
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

  write_lines(list(warnings()), file = "~/log_r_setup.txt")

  installr::install.Rtools()

  installr::install.RStudio()

  #rstudioapi::getThemes()
  #rstudioapi::applyTheme("One Dark {rsthemes}")
  #rstudioapi::applyTheme("Nord Polar Night Aurora {rsthemes}")
  #rstudioapi::applyTheme("Night Owl {rsthemes}")
  #rstudioapi::applyTheme("Material {rsthemes}")
  rstudioapi::applyTheme("Material Ocean {rsthemes} ")

  message(paste0(
    "\n\n---- Please also visit and install: ---------------",
    "\n https://git-scm.com",
    "\n https://github.com/nvbn/thefuck",
    "\n test",
    "\n\n",
    "\n\n---- RStudio Setup: -------------------------------",
    "\n Rainbow parentheses",
    "\n Continue Comment on new line",
    "\n Margin to 80",
    "\n Highlight function calls",
    "\n Don't save user workspace",
    "\n\n",
    "\n\n---- Manual Setup: --------------------------------",
    "\n Autostart system-monitoring CPU and RAM use (task-manageretc.)",
    "\n\n"
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
# --> write warnings() after install.packages(list) into logfile
#
# Update R (Windows): installr::updateR()
# update.packages(ask = FALSE)
#
# R_HOME
# R.home()
#
# HOME
# Sys.getenv("HOME")
# --> TODO: setup a .Rprofile file in HOME
# file.edit("~/.Rprofile")
#
# normalizePath("C:/DATA/data.csv")
#
# TODO
# write "erinnermich" function with useful functions
# * file.edit("~/.Rprofile")
# * Sys.getenv()
# * update.packages()
# * normalizePath("C:/DATA/data.csv")
