#' Email input with floating label
#'
#' @param ... Passed to [shiny::textInput()]
#' @inheritParams shiny::textInput
#' @return shiny.tag
floating_email_input <- \(..., placeholder) {
  tag_q <- floating_text_input(..., placeholder = placeholder) |>
    htmltools::tagQuery()
  tag_q$find("input")$removeAttrs("type")$addAttrs("type" = "email")$allTags()
}
