Template.photoAdd.events
  'change input': (ev) ->
    Session.set('isLoading', true)
    blob = ev.srcElement.files[0]
    reader = new FileReader()
    self = @
    reader.onload = (file) ->
      Meteor.call 'photoAdd', file.srcElement.result, blob.name, ->
        Session.set('isLoading', false)
      	Meteor.Router.to('/')
    reader.readAsBinaryString(blob)

Template.photoAdd.helpers
  isLoading: ->
    Session.get('isLoading')