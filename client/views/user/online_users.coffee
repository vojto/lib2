Template.onlineUsers.helpers
  onlineUsers: ->
    userIds = Meteor.presences.find().fetch().map (p) -> p.userId
    userIds = _.uniq(userIds)
    userIds.map (id) -> Meteor.users.findOne(id)