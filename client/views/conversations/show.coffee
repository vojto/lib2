Template.conversationShow.helpers
  conversation: ->
    otherUsername = Session.get('conversationOtherUsername')

    ###
    Let's use RPC here and find/create conversation server side here.
    Other option would be to publish conversation based on session value we just set by navigating to this page.
    Then keep the logic here to create the conversation if it wasn't found. But, let's just
    do it server side this time.
    ###

    Meteor.call 'conversationAdd', otherUsername, (err, conversation) ->
      Session.set('conversationId', conversation._id)

  conversationId: ->
    id = Session.get('conversationId')
    console.log 'id=', id
    id

  messages: ->
    id = Session.get('conversationId')
    ConversationMessages.find({conversationId: id}, {sort: {timestamp: 1}})

  sender: (message) ->
    sender = Meteor.users.findOne(message.senderId)
    sender

Template.conversationShow.events
  'submit form': (ev) ->
    ev.preventDefault()

    $input = $(ev.target).find('input')

    Meteor.call 'conversationAddMessage', Session.get('conversationId'), {content: $input.val()}

    $input.val('')