Meteor.subscribe 'currentUserPhoto'
Meteor.subscribe 'messages'
Meteor.subscribe 'currentUser'

Deps.autorun ->
  Meteor.subscribe 'profileUser', Session.get('profileUsername')