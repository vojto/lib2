Meteor.subscribe 'currentUserPhoto'
Meteor.subscribe 'messages'
Meteor.subscribe 'currentUser'
Meteor.subscribe 'allUsers'
Meteor.subscribe 'onlineUsers'
Meteor.subscribe 'conversationsOfCurrentUser'

Deps.autorun ->
  Meteor.subscribe 'profileUser', Session.get('profileUsername')
  Meteor.subscribe 'conversationMessages', Session.get('conversationId')

sound = new Audio('/beep.mp3');

Meteor.startup ->
  messages = Messages.find().fetch()
  console.log 'messages: ', messages
  Messages.find({}, {sort: {timestamp: -1}, limit: 1}).observe
    addedAt: (message, atIndex, before) ->
      if message.userId != Meteor.userId()
        sound.play()