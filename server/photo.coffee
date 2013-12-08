Meteor.methods
  photoAdd: (blob, name) ->
    fs = Npm.require('fs')
    path = Npm.require('path')

    chroot = Meteor.chroot
    directory = path.resolve("#{process.cwd()}/../../../../../public/photos")
    path = "#{directory}/#{name}"
    nameSmall = name.replace(/(.*)(\.[^\.]+)$/, '$1_small$2')
    pathSmall = "#{directory}/#{nameSmall}"

    writeFile = Meteor._wrapAsync(fs.writeFile)

    writeFile(path, blob, 'binary')

    console.log "File was saved to: #{path}"

    # # Make the small version
    Imagemagick.convert([path, '-resize', '64x64^', '-extent', '64x64', '-gravity', 'center', pathSmall])

    console.log 'done'