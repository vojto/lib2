Template.photoAdd.events
  'change input': (ev) ->
    Session.set('isLoading', true)
    blob = ev.target.files[0]
    reader = new FileReader()
    self = @
    reader.onload = (file) ->
      debugger
      Meteor.call 'photoAdd', file.target.result, blob.name, ->
        Session.set('isLoading', false)
      	Meteor.Router.to('/')
    reader.readAsBinaryString(blob)

Template.photoAdd.helpers
  isLoading: ->
    Session.get('isLoading')