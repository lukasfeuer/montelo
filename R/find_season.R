#' Find Season
#'
#' Gives an overview of p-values for all possible sin-curves
#'
#' @param model model object
#' @param data data frame
#' @param teiler double, 8.304 for weekly
#'
#' @return
#' @export
#'
#'
find_season <- function(
  model,
  data,
  teiler
) {

  kw_season <- vector("character")
  for (i in 1:52) {

    kw_season[i] <- paste0("sin((ZAEHLER+", i, ")/(", teiler, "))")

  }

  model_list <- lapply(kw_season,
                       append_season_model,
                       model = model,
                       data = data) ;

  p_werte <- mapply(get_season_sig,
                    model_list,
                    var = kw_season) ;


  plot(p_werte, xaxt = "n", ylab = "p-Werte", xlab = "",
       type = "b", col = "blue", lty = 2, bty = "n")
  graphics::title(paste("Signifikance for Season (Week)"), adj = 0)
  graphics::axis(1, at = 1:length(p_werte), labels = 1:length(p_werte))
  graphics::abline(a = 0.05, b = 0);


  ausgabe <- knitr::kable(
    data.frame(
      p_Werte = p_werte),
    digits = 5,
    col.names = c("p Wert"),
    align = "r",
    caption = paste("Signifikance for Season ")
  );

  return(ausgabe)

}
