#' Check if all input fields are truthy
#'
#' Particularly useful in [mod_auth_server()]
#' @param ... Values to check for truthyness
#' @return `TRUE` (invisibly) if all values are truthy. Otherwise, throws
#' an error.
#' @examples
#' \dontrun{
#' inputs <- list(
#'   email = NULL,
#'   display_name = "Carol",
#'   password = "mYv3ryL0ngPa22w@Rd.",
#'   confirm_password = "mYv3ryL0ngPa22w@Rd."
#' )
#' # check if all inputs are truthy:
#' rlang::inject(check_all_inputs_filled(!!!inputs))
#'
#' inputs$email <- "caroline.mwangi95@gmail.com"
#' rlang::inject(check_all_inputs_filled(!!!inputs))
#' }
check_all_inputs_filled <- \(...) {
  cond <- list(...) |>
    sapply(shiny::isTruthy) |>
    all()
  if (!cond) {
    stop("Please fill in all the fields.", call. = FALSE)
  }
  invisible(TRUE)
}
