#' Make floating label of an input
#'
#' Generally used with [shiny::textInput()] and [shiny::passwordInput()]
#' to make floating labels
#' @param tag [shiny::textInput()] or [shiny::passwordInput()]
#' @return shiny.tag
make_floating_label <- \(tag) {
  tag_q <- htmltools::tagQuery(tag)
  tag_q$addClass("form-floating")
  input_tag <- tag_q$find("input")$selectedTags()
  tag_q$find("input")$remove()
  tag_q$prepend(input_tag)
  tag_q$allTags()
}
