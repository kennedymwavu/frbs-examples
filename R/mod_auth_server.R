#' Authentication module server
#'
#' @param id Module id
mod_auth_server <- \(id) {
  moduleServer(
    id = id,
    module = \(input, output, session) {
      ns <- session$ns
      min_password_length <- 8L

      enable_signin_btn <- \() {
        session$sendCustomMessage(
          type = "enable_auth_btn",
          list(id = ns("signin_submit"))
        )
      }
      enable_signup_btn <- \() {
        session$sendCustomMessage(
          type = "enable_auth_btn",
          list(id = ns("signup_submit"))
        )
      }
      switch_auth_form_tab <- \(selected) {
        freezeReactiveValue(x = input, name = "auth_form")
        updateTabsetPanel(
          session = session,
          inputId = "auth_form",
          selected = selected
        )
      }

      # switch btwn signin & signup:
      observeEvent(input$go_to_signup, switch_auth_form_tab("signup"))
      observeEvent(input$go_to_signin, switch_auth_form_tab("signin"))

      rv_user_inputs <- reactiveValues(
        email = NULL,
        password = NULL,
        display_name = NULL
      )
      rv_user_details <- reactiveVal()

      # signup----
      observeEvent(input$signup_submit, {
        email <- input$signup_email
        display_name <- input$signup_display_name
        password <- input$signup_password
        confirm_password <- input$signup_confirm_password

        tryCatch(
          expr = {
            check_all_inputs_filled(
              email, display_name, password, confirm_password
            )
            check_password_length(password, min_password_length)
            check_confirm_password(password, confirm_password)

            rv_user_inputs$email <- email
            rv_user_inputs$display_name <- display_name
            rv_user_inputs$password <- password

            user <- frbs::frbs_sign_up(email, password)
            if (!is.null(user$error)) {
              stop("Registration failed!", call. = FALSE)
            }

            user_details <- frbs::frbs_get_user_data(user$idToken)
            # add `idToken` to 'user_details':
            user_details$idToken <- user$idToken
            rv_signed_in(user_details)
            toast_success(message = "Account successfully created!")
          },
          error = \(e) {
            print(e)
            enable_signup_btn()
            toast_error(message = conditionMessage(e), timeOut = 0)
          }
        )
      })

      # signin----
      rv_signed_in <- reactiveVal()
      observeEvent(input$signin_submit, {
        email <- input$signin_email
        password <- input$signin_password

        tryCatch(
          expr = {
            check_all_inputs_filled(email, password)
            user <- frbs::frbs_sign_in(email, password)
            if (!is.null(user$error)) {
              stop("Invalid login credentials!", call. = FALSE)
            }
            user_details <- frbs::frbs_get_user_data(user$idToken)
            # add `idToken` to 'user_details':
            user_details$idToken <- user$idToken
            rv_signed_in(user_details)
          },
          error = \(e) {
            print(e)
            enable_signin_btn()
            toast_error(message = conditionMessage(e), timeOut = 0)
          }
        )
      })

      # check if signin was successful:
      observeEvent(rv_signed_in(), {
        switch_auth_form_tab("waiting_signin")

        tryCatch(
          expr = {
            user_details <- rv_signed_in() |> lapply(`[[`, 1)
            user_email <- user_details$users$email

            ## Save user to database if need be.
            ## You have to create the functions `user_exists()` and
            ## `create_user()`.
            # if (!user_exists(email = user_email)) {
            #   display_name <- rv_user_inputs$display_name %||%
            #     user_details$users$displayName %||%
            #     ""
            #   create_user(email = user_email, display_name = display_name)
            # }

            # send verification link:
            if (isFALSE(user_details$users$emailVerified)) {
              frbs::frbs_send_email_verification(id_token = user_details$idToken)
              modal <- email_verification_modal(user_email)
              showModal(modal)
              return()
            }

            ## if you have user permissions (which you most likely do), check
            ## if user enabled.
            ## Again, you have to create the function `user_is_enabled()` as per
            ## your usecase.
            # if (!user_is_enabled(email = user_email)) {
            #   showModal(approval_required_modal())
            #   return()
            # }

            # if all checks have passed, sign user in:
            rv_user_details(user_details)

            ## You can as well read a specific user from your DB, esp if you're
            ## implementing user permissions.
            # rv_user_details(read_user(email = user_email))

            toast_success(message = "Signed In!")
          },
          error = \(e) {
            switch_auth_form_tab("signin")
            enable_signin_btn()

            print(e)
            toast_error(
              title = "Error",
              message = "An error occurred while signing you in"
            )
          }
        )
      })

      # return user details:
      return(rv_user_details)
    }
  )
}
