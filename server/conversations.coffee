Meteor.methods
  conversationAdd: (otherUsername) ->
    currentUser = Meteor.user()
    unless currentUser
      throw new Meteor.Error(401, "Not logged in");

    # Find user
    user = Meteor.users.findOne(username: otherUsername)
    if !user
      throw new Meteor.Error(404, "User not found");



    # Try to find the conversation
    conversation = Conversations.findOne
      $or: [{
        user1Id: user._id,
        user2Id: currentUser._id
      }, {
        user1Id: currentUser._id,
        user2Id: user._id
      }]

    unless conversation
      conversation = Conversations.insert
        user1Id: currentUser._id,
        user2Id: user._id

    conversation

  conversationAddMessage: (conversationId, message) ->
    currentUser = Meteor.user()
    unless currentUser
      throw new Meteor.Error(401, "Not logged in");

    # Find conversation
    conversation = Conversations.findOne(conversationId)
    if !conversation
      throw new Meteor.Error(404, "Conversation not found");

    ConversationMessages.insert
      conversationId: conversation._id
      content: message.content
      senderId: currentUser._id