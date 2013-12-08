Template.messagesList.events
  'submit form': (ev) ->
    ev.preventDefault()

    input = $(ev.target).find('input')

    Meteor.call 'messageAdd', {content: input.val()}, ->
      console.log 'done adding message'

    input.val('')

Template.messagesList.helpers
  messages: ->
    Messages.find()