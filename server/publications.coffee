Meteor.publish 'photos', ->
  Photos.find()

USER_FIELDS = {currentPhotoId: 1, username: 1}

PHOTO_MAPPING = {key: 'currentPhotoId', collection: Photos}
USER_MAPPING = (key) ->
  key: key
  collection: Meteor.users
  options: {fields: USER_FIELDS}
  mappings: [PHOTO_MAPPING]

# Users
# -----------------------------------------------------------------------------

Meteor.publish 'currentUser', ->
  Meteor.users.find({_id: @userId}, fields: USER_FIELDS)

Meteor.publish 'profileUser', (username) ->
  Meteor.publishWithRelations
    handle: @
    collection: Meteor.users
    filter: {username: username}
    options: {fields: USER_FIELDS}
    mappings: [PHOTO_MAPPING]

Meteor.publish 'allUsers', ->
  Meteor.publishWithRelations
    handle: @
    collection: Meteor.users
    filter: {}
    options: {fields: USER_FIELDS, limit: 30}
    mappings: [PHOTO_MAPPING]

Meteor.publish 'allPresences', ->
  Meteor.publishWithRelations
    handle: @
    collection: Meteor.presences
    filter: {state: 'online'}
    options: {}
    mappings: [{
      key: 'userId'  
      collection: Meteor.users
      options: {fields: USER_FIELDS}
      mappings: [PHOTO_MAPPING]
    }]

# Photos
# -----------------------------------------------------------------------------

Meteor.publish 'currentUserPhoto', ->
  Photos.find({userId: @userId})

# Messages
# -----------------------------------------------------------------------------

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

# Conversations
# -----------------------------------------------------------------------------

Meteor.publish 'conversationsOfCurrentUser', ->
  Meteor.publishWithRelations
    handle: @
    collection: Conversations
    filter: {$or: [{user1Id: @userId}, {user2Id: @userId}]}
    mappings: [USER_MAPPING('user1Id', 'user2Id')]
    

Meteor.publish 'conversationMessages', (conversationId) ->
  console.log 'publishing messages', conversationId
  ConversationMessages.find({conversationId: conversationId}, {limit: 10, sort: {timestamp: -1}})