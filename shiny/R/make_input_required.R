#' Make a form input to be 'required'
#'
#' @param tag shiny.tag which has an input tag
#' @return shiny.tag
make_input_required <- \(tag) {
  tag_q <- htmltools::tagQuery(tag)
  tag_q$find("input")$addAttrs("required" = NA)
  tag_q$allTags()
}
