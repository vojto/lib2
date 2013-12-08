Template.layoutHeader.events
  'click .logout': (ev) ->
    ev.preventDefault()
    Meteor.logout()
    Meteor.Router.to('/')