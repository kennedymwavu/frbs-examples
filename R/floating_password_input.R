#' Password input with floating label
#'
#' @param ... Passed to [shiny::passwordInput()]
#' @param min_length Minimum length of the password. Defaults to 8 characters.
#' @inheritParams shiny::passwordInput
#' @return shiny.tag
floating_password_input <- \(
  ...,
  placeholder,
  min_length = 8L,
  autocomplete = NULL
) {
  tag_q <- passwordInput(..., placeholder = placeholder) |>
    make_floating_label() |>
    htmltools::tagQuery()
  # minimum length:
  if (!is.null(min_length)) {
    tag_q$find("input")$
      removeAttrs("minlength")$
      addAttrs("minlength" = min_length)
  }
  # autocompletion:
  if (!is.null(autocomplete)) {
    tag_q$find("input")$
      removeAttrs("autocomplete")$
      addAttrs("autocomplete" = autocomplete)
  }
  tag_q$allTags()
}
