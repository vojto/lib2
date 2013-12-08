Meteor.publish 'photos', ->
  Photos.find()

Meteor.publish 'currentUser', ->
  Meteor.users.find({
    _id: @userId  
  }, fields: {
    currentPhotoId: 1  
  })

Meteor.publish 'currentUserPhoto', ->
  Photos.find({userId: @userId})

Meteor.publish 'messages', ->
  Meteor.publishWithRelations
    handle: @
    collection: Messages
    filter: {}
    options: {sort: {timestamp: -1}, limit: 30}
    mappings: [{
      key: 'userId'
      collection: Meteor.users
      options: {fields: {'currentPhotoId': 1, 'username': 1}}
      mappings: [{
        key: 'currentPhotoId'
        collection: Photos
      }]
    }]