Meteor.methods
  messageAdd: (message) ->
    user = Meteor.user()

    if !user
      throw new Meteor.Error 401, 'not logged in'

    if !message.content
      throw new Meteor.Error 402, 'missing content'

    message.userId = user._id
    message.timestamp = new Date().getTime()

    Messages.insert(message)