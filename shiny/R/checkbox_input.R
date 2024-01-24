#' Checkbox input
#'
#' @param ... Passed to [shiny::checkboxInput()]
#' @param on_click String. JS code to be called when the checkbox input
#' is clicked. Useful especially for "Show password" checkboxes.
#' @return shiny.tag
checkbox_input <- \(..., on_click = NULL) {
  tag <- checkboxInput(...)
  if (is.null(on_click)) {
    return(tag)
  }
  tag_q <- htmltools::tagQuery(tag)
  tag_q$find("input")$addAttrs(onclick = on_click)
  tag_q$allTags()
}
