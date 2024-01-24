ui <- bslib::page(
  title = "Firebase Auth",
  theme = bslib::bs_theme(version = 5, preset = "bootstrap"),
  lang = "en",
  shinyjs::useShinyjs(),
  shinytoastr::useToastr(),
  tags$head(
    tags$link(rel = "stylesheet", href = "styles.css"),
    tags$script(src = "script.js")
  ),
  tags$body(
    tabsetPanel(
      id = "pages",
      type = "hidden",
      selected = "auth",
      tabPanelBody(
        value = "auth",
        mod_auth_ui(id = "auth")
      ),
      tabPanelBody(
        value = "app",
        uiOutput(outputId = "app")
      )
    )
  )
)
