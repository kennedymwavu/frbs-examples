#' Text input with floating label
#'
#' @param ... Passed to [shiny::textInput]
floating_text_input <- \(..., placeholder) {
  textInput(..., placeholder = placeholder) |> make_floating_label()
}
