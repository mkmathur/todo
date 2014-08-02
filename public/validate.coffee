$(document).ready ->
  $("#loginForm").bootstrapValidator
    excluded: [
      ":disabled"
      ":hidden"
      ":not(:visible)"
    ]
    message: "Invalid"
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      username:
        validators:
          notEmpty:
            message: "The username is required"

      password:
        validators:
          notEmpty:
            message: "The password is required"

  $("#signupForm").bootstrapValidator
    excluded: [
      ":disabled"
      ":hidden"
      ":not(:visible)"
    ]
    message: "Invalid"
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      username:
        validators:
          notEmpty:
            message: "Required"

      password:
        validators:
          notEmpty:
            message: "Required"
          stringLength:
          	min: 6
          	max: 16
          	message: 'Password must be between 6 and 16 characters.'

      confirm:
        validators:
          notEmpty:
            message: "Required"

          identical:
            field: "password"
            message: "These passwords don't match. Try again?"

  return
