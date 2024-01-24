#' Create a vertically & horizontally centered modal dialog
#'
#' Uses bootstrap 5 classes
#' @param ... Passed to [shiny::modalDialog()]
#' @examples
#' shinyApp(
#'   ui = bslib::page(
#'     theme = bslib::bs_theme(version = 5),
#'     actionButton("show", "Show modal dialog")
#'   ),
#'   server = function(input, output) {
#'     observeEvent(input$show, {
#'       showModal(centered_modal(
#'         title = "Important message",
#'         "This is an important message!"
#'       ))
#'     })
#'   }
#' )
#' @return [shiny::modalDialog()]
centered_modal <- \(...) {
  modal_tag_q <- shiny::modalDialog(...) |> htmltools::tagQuery()
  modal_tag_q$find(".modal-title")$addClass("w-100")
  modal_tag_q$find(".modal-dialog")$addClass("modal-dialog-centered")
  modal_tag_q$find(".modal-body")$addClass("p-4")
  modal_tag_q$allTags()
}
