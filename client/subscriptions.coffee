Meteor.subscribe 'currentUserPhoto'
Meteor.subscribe 'messages'
Meteor.subscribe 'currentUser'
Meteor.subscribe 'allUsers'
Meteor.subscribe 'conversationsOfCurrentUser'
Meteor.subscribe 'allPresences'

Deps.autorun ->
  Meteor.subscribe 'profileUser', Session.get('profileUsername')
  Meteor.subscribe 'conversationMessages', Session.get('conversationId')