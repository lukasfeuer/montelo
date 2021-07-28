#' MMM Plot
#'
#' Produces a time series plot to compare model prediction and actual values for
#' a given AV. Also displays residuals in an interactive display in the viewer.
#'
#' @param model model object
#' @param av AV of the model
#' @param time_series time series object for x-axis
#'
#' @return
#' @export
#'
mmm_plot <- function(model, av, time_series) {

  ## Model vs. Actual Plot
  model_plot <- cbind(model$fitted.values, av)

  colnames(model_plot) <- c("Model", "Actual")

  model_plot <- xts::xts(x = model_plot, order.by = time_series)

  resid_plot <- xts::xts(x = model$residuals, order.by = time_series)

  htmltools::browsable(htmltools::tagList(
    dygraphs::dygraph(model_plot, group = "mmm_plot", width = 'auto', height = 200) %>%
      dygraphs::dyOptions(labelsUTC = TRUE, fillGraph=FALSE, fillAlpha=0.1, drawGrid = FALSE, colors=c("#216ead", "#494a4a")) %>%
      #dyRangeSelector() %>%
      dygraphs::dyCrosshair(direction = "vertical") ,

    dygraphs::dygraph(resid_plot, group = "mmm_plot", width = 'auto', height = 200) %>%
      dygraphs::dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = FALSE, colors="#D8AE5A") %>%
      dygraphs::dyRangeSelector() %>%
      dygraphs::dyCrosshair(direction = "vertical") %>%
      dygraphs::dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2, hideOnMouseOut = TRUE)
  )
  )
}
