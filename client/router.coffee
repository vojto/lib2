Meteor.Router.add
  '/': 'welcome'

  '/prihlasenie': 'userLogin'
  '/registracia': 'userSignup'

  '/registracia/foto': 'photoAdd'

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

Meteor.Router.filter 'requireNotLoggedIn', only: 'userLogin'
Meteor.Router.filter 'requireLoggedIn', only: ['photoAdd']