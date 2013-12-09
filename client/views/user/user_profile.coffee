Template.userProfile.helpers
  user: ->
    user = Meteor.users.findOne(username: Session.get('profileUsername'))
    user