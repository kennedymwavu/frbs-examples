#' Check password length
#'
#' @param password User password
#' @param min_password_length Minimum password length allowed
#' @return `TRUE` (invisibly) if `password` has at least `min_password_length`
#' characters. Otherwise, an error is thrown.
#' @examples
#' \dontrun{
#' min_password_length <- 8L
#' password <- "mYv3ryL0ngPa22w@Rd."
#' check_password_length(password, min_password_length)
#'
#' password <- "mYv3"
#' check_password_length(password, min_password_length)
#' }
check_password_length <- \(password, min_password_length) {
  if (nchar(password) < min_password_length) {
    msg <- sprintf(
      "Password must be at least %d characters long.",
      min_password_length
    )
    stop(msg, call. = FALSE)
  }
  invisible(TRUE)
}
