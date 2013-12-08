Meteor.Router.add
  '/': 'welcome'

  '/prihlasenie': 'userLogin'
  '/registracia': 'userSignup'

  # '/posts/:_id':
  #   to: 'postPage'
  #   and: (id) -> Session.set('currentPostId', id)

  # '/submit': 'postSubmit'

# Meteor.Router.filters
#   'requireLogin': (page) ->
#     if Meteor.user()
#       page
#     else if Meteor.loggingIn()
#       'loading'
#     else
#       'accessDenied'

# Meteor.Router.filter 'requireLogin', only: 'postSubmit'