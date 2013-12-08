Meteor.publish 'photos', ->
  Photos.find()

USER_FIELDS = {currentPhotoId: 1, username: 1}

PHOTO_MAPPING = {key: 'currentPhotoId', collection: Photos}

Meteor.publish 'currentUser', ->
  Meteor.users.find({_id: @userId}, fields: USER_FIELDS)

Meteor.publish 'profileUser', (username) ->
  Meteor.publishWithRelations
    handle: @
    collection: Meteor.users
    filter: {username: username}
    options: {fields: USER_FIELDS}
    mappings: [PHOTO_MAPPING]

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
      options: {fields: USER_FIELDS}
      mappings: [PHOTO_MAPPING]
    }]