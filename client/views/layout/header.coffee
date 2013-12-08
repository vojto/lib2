Template.layoutHeader.events
  'click .logout': (ev) ->
    ev.preventDefault()
    Meteor.logout()
    Meteor.Router.to('/')

Template.layoutHeader.helpers
  # TODO: Make this helper shared
  userAvatar: (user) ->
    photo = Photos.findOne(user.currentPhotoId)
    if photo
      "/photos/#{photo.nameSmall}"
    else
      '/default_avatar.png'
      # TODO show default image if nothing found