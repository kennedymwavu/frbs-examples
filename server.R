server <- \(input, output, session) {
  # auth----
  rv_user_details <- mod_auth_server(id = "auth")
  observeEvent(rv_user_details(), {
    req(rv_user_details())
    updateTabsetPanel(
      session = session,
      inputId = "pages",
      selected = "app"
    )
  })

  # render app----
  output$app <- renderUI({
    req(rv_user_details())
    tags$div(
      class = "container mt-5 d-flex justify-content-center align-items-center",
      create_card(
        title = sprintf("Hello, %s", rv_user_details()$users$email),
        tags$p("We are happy to have you on board!")
      )
    )
  })
}
