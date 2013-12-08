Template.userLogin.events
  'submit form': (ev) ->
    ev.preventDefault()

    target = $(ev.target)

    username = target.find('#username').val()
    password = target.find('#password').val()

    Meteor.loginWithPassword username, password, (err) ->
      if err
        Flash.error("Prihlasenie sa nepodarilo: #{err.reason}")