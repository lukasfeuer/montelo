#' MMM Template
#'
#' Generates a .R-file with the basic code structure and dependencies for MMM.
#'
#' @param path string, optional path to save the file to, default is current wd
#' @param filename string for the file name e.g. "myModelFile" - no file extension
#'
#' @return Generates a .R-file with a template for MMM-Modeling
#' @export
#'
#'
mmm_template <- function(path = NULL, filename = "mmm_template") {

  if (!is.null(path)) {
    setwd(path)
    }

  fileConn<-file(paste0(filename, ".R"))
  writeLines(c(
'#===============================================================================:
# New | Analysis ----
#===============================================================================:

#rm(list=ls())

# Packages ---------------------------------------------------------------------
required_packages <- list(
  "data.table",
  "tidyverse", "dtplyr", "lubridate", "readxl",
  "ISOweek", "dygraphs",
  "ByndModFun")

invisible(lapply(required_packages,
                 require,
                 character.only = TRUE))

ifelse(require(destatiscleanr), require(destatiscleanr), {
  devtools::install_github("cutterkom/destatiscleanr")
  require(destatiscleanr)
})

source("02_Skripte/Modellingfunktionen.R")

#options(scipen = 50)
#options(digits = 3)

# Daten ---------------------------------------------------------------

daten <- read_csv2("01_Daten/Modellingdaten.csv",
                   col_types = cols(cwdate = col_date()))

# Transformationen -------------------------------------------------------------

setDT(daten)

source("02_Skripte/Transformationen.R")

modellierung_start <- ISOweek::ISOweek2date("2018-W01-1")
modellierung_ende <- ISOweek::ISOweek2date("2021-W52-1")

daten <- daten[between(cwdate,modellierung_start, modellierung_ende)]

codes <- names(daten)
anyDuplicated(codes)

codes

dygraph(as.data.table(daten[, c("cwdate", "sa_stk")])) %>%
  dyOptions(
    labelsUTC = TRUE,
    fillGraph = TRUE,
    fillAlpha = 0.1,
    drawGrid = FALSE,
    colors = "#216ead"
  ) %>%
  dyCrosshair(direction = "vertical")


# 1 | Modell Setup -------------------------------------------------------------

# load("daten_m1.RData")

m1 <- lm(sa_stk ~ 1
          #+ sin((zaehler + 0)/8.304)
          #+ sin((zaehler + 0)/4.152)

          #+ dum1

          , data = daten
);summary(m1); model_stats(m1); mmm_plot(m1)

daten$dum1 <- set_dummy(m1)

preview(m1)

p_check(varGroup = "^e_",
        dummy = F,
        model = m1,
        data = daten)


# Modellexport ------------------------------------------------------------

## Übertragen in entsprechendes Berechnungsskript:
## Saisons als Datenreiehen in Daten speichern (z.B.:)
daten$saison1_m1 <- sin((daten$zaehler + 0)/8.304)
daten$saison2_m1 <- sin((daten$zaehler + 0)/4.152)

#m1 <-
#  update(m1,
#         . ~ .
#         + saison1_m1 + saison2_m1
#         - sin((zaehler + 0) / 8.304)
#         - sin((zaehler + 0) / 4.152),
#         data = daten)

modellingergebnisse <- list(
  name = paste0("[Div]_[Produkt]_[Einheit]_", lubridate::today()),
  ziel_var = "sa_stk",
  model = m1,
  data = daten,
  pricing_var = "sa_preis",
  base_ppt = c(
    "sin((zaehler + 0)/8.304)",
    "sin((zaehler + 0)/4.152)",
    "cov_mob_google_transit_stations",
    "e_einkaufstage",
    "e_ferien",
    "dum_m1"
  ),
  base_media = c(
    "cov_mob_google_transit_stations",
    "e_einkaufstage",
    "dum_m1"
  ),
  base_extern = c(
    "dum_m1"
  )
)
# Schema "Modell_Zielvariable_Datum"
save(modellingergebnisse, file = paste0("03_Ergebnisse/Modell_M1_", lubridate::today(), ".RData"))

'), fileConn)
  close(fileConn)
}
