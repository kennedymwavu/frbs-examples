#' Approval required modal dialog
#'
#' @return [shiny::modalDialog()]
approval_required_modal <- \() {
  centered_modal(
    title = NULL,
    footer = NULL,
    easyClose = FALSE,
    tags$div(
      class = "card",
      tags$div(
        class = "card-body bg-danger border border-2 border-danger rounded-2",
        tags$h6(
          paste(
            "Approval is required to access this application.",
            "Please contact the administrator for assistance."
          )
        )
      )
    )
  )
}
