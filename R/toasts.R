#' Toast a success notification with some default customizations
#'
#' @param ... Passed to [shinytoastr::toastr_success()]
toast_success <- \(
  ...,
  position = "bottom-center",
  progressBar = TRUE,
  closeButton = TRUE
) {
  shinytoastr::toastr_success(
    ...,
    position = position,
    progressBar = progressBar,
    closeButton = closeButton
  )
}

#' Toast an error notification with some default customizations
#'
#' @param ... Passed to [shinytoastr::toastr_error()]
toast_error <- \(
  ...,
  position = "bottom-center",
  progressBar = TRUE,
  closeButton = TRUE
) {
  shinytoastr::toastr_error(
    ...,
    position = position,
    progressBar = progressBar,
    closeButton = closeButton
  )
}

#' Toast a warning notification with some default customizations
#'
#' @param ... Passed to [shinytoastr::toastr_warning()]
toast_warning <- \(
  ...,
  position = "bottom-center",
  progressBar = TRUE,
  closeButton = TRUE
) {
  shinytoastr::toastr_warning(
    ...,
    position = position,
    progressBar = progressBar,
    closeButton = closeButton
  )
}

#' Toast an info notification with some default customizations
#'
#' @param ... Passed to [shinytoastr::toastr_info()]
toast_info <- \(
  ...,
  position = "bottom-center",
  progressBar = TRUE,
  closeButton = TRUE
) {
  shinytoastr::toastr_info(
    ...,
    position = position,
    progressBar = progressBar,
    closeButton = closeButton
  )
}
