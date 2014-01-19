Template.onlineUsers.helpers
  onlineUsers: ->
    Meteor.users.find({'status.online': true})