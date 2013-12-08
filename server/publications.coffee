Meteor.publish 'photos', ->
  Photos.find()

Meteor.publish 'currentUserPhoto', ->
  Photos.find({userId: @userId})