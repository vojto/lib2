Handlebars.registerHelper 'formField', (options) ->
  options = options.hash
  new Handlebars.SafeString """
  <div class=\"input\">\
    <label>#{options.label}</label>\
    <input name="#{options.name}" type="#{options.type}" id="#{options.name}" />\
  </div>
  """

Handlebars.registerHelper 'userAvatar', (user) ->
  photo = Photos.findOne(user.currentPhotoId) if user
  if photo
    "/photos/#{photo.nameSmall}"
  else
    '/default_avatar.png'
    # TODO show default image if nothing found

Handlebars.registerHelper 'compareObjects', (obj1, obj2) ->
  obj1._id == obj2._id

Handlebars.registerHelper 'timestampFormat', (timestamp) ->
  moment.unix(timestamp).format('D.M. H:mm:ss')