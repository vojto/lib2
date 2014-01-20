replaceURLWithHTMLLinks = (text) ->
    exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig
    text.replace(exp,"<a href='$1' target='_blank'>$1</a>")

Template.messagesList.events
  'submit form': (ev) ->
    ev.preventDefault()

    input = $(ev.target).find('input')

    Meteor.call 'messageAdd', {content: input.val()}, ->
      console.log 'done adding message'

    input.val('')

Template.messagesList.helpers
  messages: ->
    Messages.find({}, {sort: {timestamp: -1}})

  user: (message) ->
    user = Meteor.users.findOne(message.userId)
    user

  userPhoto: (message) ->
    user = Meteor.users.findOne(message.userId)
    Photos.findOne(user.currentPhotoId).nameSmall

  doSomethingWith: (what) ->
    console.log 'what', what

  formatContent: (content) ->
    escaped = $('<div/>').text(content).html()
    replaceURLWithHTMLLinks(escaped)

  messageClass: (message) ->
    if message.content.indexOf(Meteor.user().username) > -1
      'mention'
    