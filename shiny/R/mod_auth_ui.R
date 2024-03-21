#' Authentication module UI
#'
#' @param id Module id
mod_auth_ui <- \(id) {
  ns <- NS(id)
  tagList(
    tags$div(
      class = "container",
      tags$div(
        class = "d-flex justify-content-center align-items-center vh-100",
        tags$div(
          style = "max-width: 100%;",
          tabsetPanel(
            id = ns("auth_form"),
            type = "hidden",
            footer = tags$div(
              class = "auth_form_loader bg-primary"
            ),
            tabPanelBody(
              value = "signin",
              create_card(
                title = "Login",
                title_icon = NULL,
                class = "shadow text-center",
                login_form(ns = ns),
                tags$p(
                  class = "mt-3 small",
                  "First time?",
                  actionLink(
                    inputId = ns("go_to_signup"),
                    label = "Register"
                  )
                )
              )
            ),
            tabPanelBody(
              value = "signup",
              create_card(
                title = "Register",
                title_icon = NULL,
                class = "shadow text-center",
                register_form(ns = ns),
                tags$p(
                  class = "mt-3 small",
                  "Already have an account?",
                  actionLink(
                    inputId = ns("go_to_signin"),
                    label = "Login"
                  )
                )
              )
            ),
            tabPanelBody(value = "waiting_signin")
          )
        )
      )
    )
  )
}
