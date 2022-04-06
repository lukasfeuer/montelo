#' MMM Plot
#'
#' Generates a dygraphs-plot to compare model prediction and actual values for
#' a given AV. Also displays residuals in an interactive display in the viewer.
#'
#' @param model object of class "lm" containing the results returned by the lm() model fitting function
#' @param data an optional data frame (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lm is called.
#' @param index single value of type "integer" or "character" to identify the time series in the original data for the model
#'
#' @return
#' @export
#'
mmm_plot <- function(model, data = NULL, index = 1) {

  if (is.null(data)) {
    # original data for the model has to be in the environment for this to work
    data <- mget(as.character(model$call[["data"]]), envir = globalenv())[[1]]
  } else {
    data <- as.data.frame(data)
  }

  av <- data[[names(model$model)[[1]]]]

  time_series <- data[[index]]

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
