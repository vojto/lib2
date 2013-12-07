Handlebars.registerHelper 'formField', (options) ->
  options = options.hash
  new Handlebars.SafeString """
  <div class=\"input\">\
    <label>#{options.label}</label>\
    <input name="#{options.name}" type="#{options.type}" id="#{options.name}" />\
  </div>
  """