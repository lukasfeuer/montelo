# -------------------------------------------------------------------------.
# R Profile Template ----
#
# Inspiration: https://csgillespie.github.io/efficientR/set-up.html
# -------------------------------------------------------------------------.

# help("Startup")

# A warm welcome
message(
  "Moin, Lukas!

Here is your routine:
  • Check for updates: utils::update.packages(ask = FALSE)
  • Visit tidyverse.org/blog/
  • Consider revisting some chapters from
    - R4DS
    - Efficient R-Programming
    - Forecasting - Principles and Practice
    - Statistical Rethinking

Have a great day!"
)

if (interactive()) {
  try(fortunes::fortune(), silent = TRUE)
}


# Preferences -------------------------------------------------------------
#
# https://www.danieldsjoberg.com/rstudio.prefs/index.html
#
#rstudio.prefs::use_rstudio_prefs(
#  always_save_history = FALSE,
#  save_workspace = "never",
#  load_workspace = FALSE,
#  rainbow_parentheses = TRUE,
#  check_for_updates = TRUE,
#  continue_comments_on_newline = TRUE,
#  default_encoding = "UTF-8",
#  document_author = "Lukas Feuer",
#  highlight_r_function_calls = TRUE,
#  highlight_selected_line = TRUE,
#  show_margin = TRUE,
#  margin_column = 80,
#  restore_last_project = FALSE,
#  scroll_past_end_of_document = TRUE,
#  shiny_viewer_type = "browser",
#  strip_trailing_whitespace = TRUE,
#  syntax_color_console = TRUE,
#  warn_variable_defined_but_not_used = TRUE,
#  windows_terminal_shell = "win-git-bash"
#)

# ?options
# options(prompt = "> ")
# options(continue = " ")
#
# Manually install and set font:
#   FiraCode Regular: https://github.com/tonsky/FiraCode
#   Victor mono: https://rubjo.github.io/victor-mono/

# Permanently set CRAN mirror to RStudio
local({
  r = getOption("repos")
  r["CRAN"] = "https://cran.rstudio.com/"
  options(repos = r)
})

#rstudioapi::getThemes()
#rstudioapi::applyTheme("One Dark {rsthemes}")
#rstudioapi::applyTheme("Nord Polar Night Aurora {rsthemes}")
#rstudioapi::applyTheme("Night Owl {rsthemes}")
#rstudioapi::applyTheme("Material {rsthemes}")
#rstudioapi::applyTheme("Material Ocean {rsthemes} ")
#if (interactive()) {
#  try(rstudioapi::applyTheme("Material Ocean {rsthemes} "),
#      silent = TRUE)
#}


# Updates -----------------------------------------------------------------

# Update R (Windows only)
#if (installr::is.windows()) {
#  installr::updateR()
#  installr::install.Rtools()
#}

# Check for package updates
#utils::update.packages(ask = FALSE)

# Install packages if not already installed
.Last = function() {
  cond = suppressWarnings(!require(fortunes, quietly = TRUE))
  if (cond)
    try(utils::install.packages("fortunes"), silent = TRUE)
  message("Goodbye at ", date(), "\n")
}


# Helper Functions ---------------------------------------------------------

# Hidden environment
.env = new.env()

# Head-Tail
.env$ht = function(d, n = 6) tibble::tibble(rbind(head(d, n), tail(d, n)), )

# View() short
.env$v = utils::View

attach(.env)
