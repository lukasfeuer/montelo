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
      "devtools",
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


  devtools::install_github("gadenbuie/rsthemes")
  rsthemes::install_rsthemes()

  #rstudioapi::getThemes()
  rstudioapi::applyTheme("One Dark {rsthemes}")
  #rstudioapi::applyTheme("Nord Polar Night Aurora {rsthemes}")
  #rstudioapi::applyTheme("Night Owl {rsthemes}")
  #rstudioapi::applyTheme("Material {rsthemes}")
  #rstudioapi::applyTheme("Material Ocean {rsthemes} ")



  rstudio.prefs::use_rstudio_prefs(
    always_save_history = FALSE,
    save_workspace = "never",
    load_workspace = FALSE,
    rainbow_parentheses = TRUE,
    check_for_updates = TRUE,
    continue_comments_on_newline = TRUE,
    default_encoding = "UTF-8",
    document_author = "Lukas Feuer",
    highlight_r_function_calls = TRUE,
    highlight_selected_line = TRUE,
    show_margin = TRUE,
    margin_column = 80,
    restore_last_project = FALSE,
    scroll_past_end_of_document = TRUE,
    shiny_viewer_type = "browser",
    strip_trailing_whitespace = TRUE,
    syntax_color_console = TRUE,
    warn_variable_defined_but_not_used = TRUE,
    windows_terminal_shell = "win-git-bash"
  )

  message(paste0(
    "\n\n---- Please also visit and install ---------------",
    "\n • Fira Code Font: https://github.com/tonsky/FiraCode",
    "\n • https://git-scm.com",
    "\n • https://github.com/nvbn/thefuck",
    "\n\n",
    "\n---- Optionally run ------------------------------",
    "\n • installr::install.Rtools(check = TRUE)",
    "\n • installr::install.RStudio()",
    "\n\n",
    "\n---- Manual Setup --------------------------------",
    "\n • Autostart system-monitoring CPU and RAM use (task-manager etc.)",
    "\n • Edit your .Rprofile: usethis::edit_r_profile()",
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
