Template.userSignup.events
  'submit form': (ev) ->
    ev.preventDefault()
    user = $(ev.target).serializeObject()

    required_fields = ['username', 'email', 'password', 'password_confirmation']
    field_labels =
      username: 'nick'
      email: 'e-mail'
      password: 'heslo'
      password_confirmation: 'potvrdenie hesla'

    for field in required_fields
      if !user[field] or user[field] == ''
        Flash.error "Prosim vypln #{field_labels[field]}"
        return
      
    if user.password != user.password_confirmation
      Flash.error 'Hesla sa nezhoduju'
      return


    options =
      username: user.username
      email: user.email
      password: user.password
      profile:
        faculty: user.faculty
        year: user.year

    Accounts.createUser options, (err) ->
      if err
        Flash.error "Nepodarilo sa vytvorit konto: #{err.reason}"
      else
        # Flash.success 'Tvoje konto bolo vytvorene! Teraz si vyber nejaku fotku.'
        Meteor.Router.to(Meteor.Router.photoAddPath())