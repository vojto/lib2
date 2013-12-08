Template.photoAdd.events
  'change input': (ev) ->
    blob = ev.srcElement.files[0]
    reader = new FileReader()
    reader.onload = (file) ->
      Meteor.call 'photoAdd', file.srcElement.result, blob.name, ->
      	Meteor.Router.to('/')
    reader.readAsBinaryString(blob)