
<!-- README.md is generated from README.Rmd. Please edit that file -->

# montelo

<!-- badges: start -->
<!-- badges: end -->

Montelo provides a loose collection of modeling functions for testing
only

-   **bank_df** - AdBank function for data-frames

-   **compare_season** - like p_check() for season-variable values

-   **log_suffix** - alternative to logger()

-   **mmm_plot** - plot a model-object

-   **mmm_template** - generate an empty R-Script for modeling in
    current wd

-   **p_check** - compare de-facto p-values of a variable group after
    addition to a given model

-   Use with ad-hoc modeling

    -   **dummynate** - Auto_Dummy
    -   **seasonate** - Season
    -   **seasonate_optimize** - find optimal Season
    -   **load_adhoc** - load ad-hoc-modeling data files

-   Helper Functions

    -   append_season_model (**helper**, do not use)
    -   bank_it (**helper**, do not use)
    -   get_season_sig (**helper**, do not use)
    -   get_sig (**helper**, do not use)

-   NEW (to be added to ByndModFun)

    -   save_adhoc()

## To Dos

-   fix dank_it/bank_df –> as_tibble?

-   reference packages for %>% and . operators used

-   write_adhoc() to write objects compatible with ad_hoc modelind
    script

-   mmm_template: maybe rewrite for ByndModFun users: remove montelo
    from require; reference functions with ByndModFun:: instead of
    montelo:: (or not at all)

-   Toy-data: montelo1

-   after added example data and example model file based in it, fill in
    all the missing examples in the functions

## Installation

Montelo is a private package. You can install the released version of
montelo from github with:

``` r
library(devtools)
install_github("lukasfeuer/montelo", auth_token = github_pat(quiet = TRUE) )
```

This requires the PAT stored in the environment. Add or edith the PAT
with:

``` r
library(devtools)
usethis::edit_r_environ()
```

paste:

``` r
GITHUB_PAT="actual_token_value"
```
