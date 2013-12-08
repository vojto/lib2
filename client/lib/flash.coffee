class @Flash
  @error: (message) ->
    @flash('error', message)

  @success: (message) ->
    @flash('success', message)

  @flash: (type, message) ->
    Session.set 'flash',
      type: type
      message: message