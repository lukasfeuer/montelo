
<!-- README.md is generated from README.Rmd. Please edit that file -->

# montelo

<!-- badges: start -->
<!-- badges: end -->

Montelo provides a loose collection of modeling functions for testing
only

-   **bank\_df** - AdBank function for data-frames

-   **compare\_season** - like p\_check() for season-variable values

-   **log\_suffix** - alternative to logger()

-   **mmm\_plot** - plot a model-object

-   **mmm\_template** - generate an empty R-Script for modeling in
    current wd

-   **p\_check** - compare de-facto p-values of a variable group after
    addition to a given model

-   Use with ad-hoc modeling

    -   **dummynate** - Auto\_Dummy
    -   **seasonate** - Season
    -   **seasonate\_optimize** - find optimal Season
    -   **load\_adhoc** - load ad-hoc-modeling data files

-   Helper Functions

    -   append\_season\_model (**helper**, do not use)
    -   bank\_it (**helper**, do not use)
    -   get\_season\_sig (**helper**, do not use)
    -   get\_sig (**helper**, do not use)

-   NEW (to be added to ByndModFun)

    -   

## To Dos

-   fix dank\_it/bank\_df –&gt; as\_tibble?

-   reference packages for %&gt;% and . operators used

-   write\_adhoc() to write objects compatible with ad\_hoc modelind
    script

-   mmm\_template: maybe rewrite for ByndModFun users: remove montelo
    from require; reference functions with ByndModFun:: instead of
    montelo:: (or not at all)

-   Toy-data: montelo1

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
