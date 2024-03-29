Meteor.Router.add
  '/': 'messagesList'

  '/prihlasenie': 'userLogin'
  '/registracia': 'userSignup'

  '/registracia/foto': 'photoAdd'

  '/profil/:username':
    to: 'userProfile'
    and: (username) -> Session.set('profileUsername', username)

  '/ludia': 'userList'

  '/spravy/:username':
    to: 'conversationShow'
    and: (username) -> Session.set('conversationOtherUsername', username)

  # '/posts/:_id':
  #   to: 'postPage'
  #   and: (id) -> Session.set('currentPostId', id)

  # '/submit': 'postSubmit'

Meteor.Router.filters
  'requireLoggedIn': (page) ->
    if Meteor.user()
      page
    else if Meteor.loggingIn()
      'loading'
    else
      'userLogin'
  'requireNotLoggedIn': (page) ->
    if Meteor.user()
      '/'
    else
      page
  'removeFlash': (page) ->
    Flash.reset()
    page

Meteor.Router.filter 'requireNotLoggedIn', only: 'userLogin'
Meteor.Router.filter 'requireLoggedIn', only: ['photoAdd', 'messagesList', 'userList']
Meteor.Router.filter 'removeFlash'