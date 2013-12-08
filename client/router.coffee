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
  'requireNotLoggedIn': (page) ->
    if Meteor.user()
      '/'
    else
      page

Meteor.Router.filter 'requireNotLoggedIn', only: 'userLogin'