Meteor.methods
  photoAdd: (blob, name) ->
    fs = Npm.require('fs')
    path = Npm.require('path')

    user = Meteor.user()
    unless user
      throw new Meteor.Error(401, "Not logged in");

    chroot = Meteor.chroot
    directory = path.resolve("#{process.cwd()}/../../../../../public/photos")
    path = "#{directory}/#{name}"
    nameSmall = name.replace(/(.*)(\.[^\.]+)$/, '$1_small$2')
    pathSmall = "#{directory}/#{nameSmall}"

    # Save to file
    writeFile = Meteor._wrapAsync(fs.writeFile)
    writeFile(path, blob, 'binary')
    console.log "File was saved to: #{path}"

    # Resize to small
    Imagemagick.convert([path, '-resize', '64x64^', '-extent', '64x64', '-gravity', 'center', pathSmall])

    # Create record in database
    photoId = Photos.insert
      name: name
      nameSmall: nameSmall
      userId: user._id

    Meteor.users.update user._id, {$set: {currentPhotoId: photoId}}

    console.log 'current user', Meteor.user()


    console.log 'done'