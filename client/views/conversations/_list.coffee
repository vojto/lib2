Template._conversationsList.helpers
  conversations: ->
    Conversations.find()

  otherUser: (conversation) ->
    currentUser = Meteor.user()

    if conversation.user1Id == currentUser._id
      otherUser = Meteor.users.findOne(conversation.user2Id)
    else
      otherUser = Meteor.users.findOne(conversation.user1Id)

    otherUser
    
    