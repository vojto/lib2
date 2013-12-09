@Conversations = new Meteor.Collection('conversations')
Conversations.allow
  insert: (userId, doc) ->
    !!userId

@ConversationMessages = new Meteor.Collection('conversationMessages')
ConversationMessages.allow
  insert: (userId, doc) ->
    !!userId