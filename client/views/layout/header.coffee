Template.layoutHeader.events
  'click .logout': (ev) ->
    ev.preventDefault()
    Meteor.logout()
    Meteor.Router.to('/')

Template.layoutHeader.helpers
  userAvatar: ->
    Photos.findOne(id: Meteor.user().currentPhotoId)