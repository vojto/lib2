Template.layoutHeader.events
  'click .logout': (ev) ->
    ev.preventDefault()
    Meteor.logout()
    Meteor.Router.to('/')

Template.layoutHeader.helpers
  userAvatar: ->
    console.log 'looking up photo with id', Meteor.user()
    console.log Meteor.user().currentPhotoId
    Photos.findOne(Meteor.user().currentPhotoId)