#' The "not-in" operator
#'
#' This is the opposite of the `%in%` operator
#'
#' @param x The vector of values to look for
#' @param y The vector of values to look in
#' @examples
#' x <- 1:3
#' y <- 3:5
#' x %in% y
#' x %!in% y
#' @return A logical vector of same length as `x`
#' @name not-in-operator
#' @export
`%!in%` <- \(x, y) !x %in% y

#' Coalescing operator to specify a default value
#'
#' This operator is used to specify a default value for a variable if the
#' original value is \code{NULL}.
#'
#' @param x a variable to check for \code{NULL}
#' @param y the default value to return if \code{x} is \code{NULL}
#' @return the first non-\code{NULL} value
#' @name op-null-default
#' @export
#' @examples
#' my_var <- NULL
#' default_value <- "hello"
#' result <- my_var %||% default_value
#' result # "hello"
#'
#' my_var <- "world"
#' default_value <- "hello"
#' result <- my_var %||% default_value
#' result # "world"
#'
"%||%" <- function(x, y) {
  if (is.null(x)) y else x
}
