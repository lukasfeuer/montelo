p_check_dummy <- function(varGroup, vergl = FALSE, model, data, dummy = TRUE) {

  # add option: contains dummy: TRUE/FALSE (default = TRUE)
  # if dummy = TRUE:
  # take in model object, update model object without the dummy variable (requirement: dummy name has to contain "dummy" --> ignore case)
  # add variable(s) from varGroup
  # add dummy
  # get sig

  TestVariables <- grep(varGroup,
                        colnames(data),
                        value = TRUE) ;

  TestVariables_list <- lapply(" . ~ . + ", paste0, TestVariables)

  model_list <- lapply(TestVariables_list[[1]], stats::update, object = model );

  p_test_vars <- mapply(get_sig,
                        model_list,
                        var = TestVariables) ;

  if (vergl == TRUE) {
    # if true, also need to get p_values for rest of model_list variables

    model_vars <- attr(model$terms, "term.labels")

    p_model_vars = list()

    for (i in 1:length(model_vars)) {
      p_temp <- mapply(get_sig,
                       model_list,
                       var = model_vars[i])
      p_model_vars[[i]] <- p_temp


    }

    names(p_model_vars) <- model_vars
    p_model_vars <- dplyr::bind_cols(p_model_vars)

    p_model_vars <- cbind(TestVariables, p_model_vars)



    p_model_vars <- reshape2::melt(p_model_vars , id.vars = "TestVariables",  variable.name = 'p_model_melt')

    p_model_vars$TestVariables <- factor(p_model_vars$TestVariables)

    fig1 <- plotly::plot_ly(p_model_vars, x = ~TestVariables, y = ~value, type = 'scatter',
                            split = ~p_model_melt, mode = "lines+markers") %>%
      plotly::add_trace( y = 0.05,
                         type = "scatter",
                         mode='lines',
                         showlegend = FALSE,
                         line = list(color = 'gray', width = 0.5))%>%
      plotly::layout(xaxis = list(categoryarray = ~names,
                                  categoryorder = "array",
                                  showgrid = FALSE),
                     colorway = c('#a3c1e7', '#add1e5', '#5b7f9e', '#10203a', '#ebdc03', '#3d3b72', '#ffc000', '#aac001', '#306ebd', '#388bb9', '#807800', '#855400'))


    p_test_vars_df <- data.frame(
      TestVariables = TestVariables,
      p_test_vars = p_test_vars
    )

    fig2 <- plotly::plot_ly(p_test_vars_df, x = ~TestVariables, y = ~p_test_vars, type = 'scatter',
                            mode = "lines+markers", showlegend = FALSE) %>%
      plotly::add_trace( y = 0.05,
                         type = "scatter",
                         mode='lines',
                         showlegend = FALSE,
                         line = list(color = 'gray', width = 0.5))%>%
      plotly::add_paths(line = list(color = "#5b7f9e"),
                        marker = list(color = "#5b7f9e"),
                        showlegend = FALSE) %>%
      plotly::layout(xaxis = list(categoryarray = ~names,
                                  categoryorder = "array",
                                  showgrid = FALSE))

    fig3 <- plotly::subplot(fig2, fig1,  nrows = 2, shareX = TRUE)

  } else {

  }

  return(fig3)
}
