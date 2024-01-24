#' Check confirm password
#'
#' Checks if `password` and `confirm_password` are identical
#' @param password User password
#' @param confirm_password Confirmation password
#' @return `TRUE` (invisibly) if `password` and `confirm_password` are
#' identical. Otherwise, throws an error.
#' @examples
#' \dontrun{
#' password <- "mYv3ryL0ngPa22w@Rd."
#' confirm_password <- "mYv3ryL0ngPa22w@Rd.2"
#' check_confirm_password(password, confirm_password)
#'
#' confirm_password <- "mYv3ryL0ngPa22w@Rd."
#' check_confirm_password(password, confirm_password)
#' }
check_confirm_password <- \(password, confirm_password) {
  if (!identical(password, confirm_password)) {
    stop("Passwords do not match.", call. = FALSE)
  }
  invisible(TRUE)
}
