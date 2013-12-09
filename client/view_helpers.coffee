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