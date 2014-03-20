"use strict"

###
Module dependencies.
###
mongoose = require("mongoose")
Schema = mongoose.Schema
crypto = require("crypto")

###
User Schema
###
UserSchema = new Schema(
  name:
    type: String
    required: true

  email: String
  username:
    type: String
    unique: true

  hashed_password: String
  provider: String
  salt: String
  facebook: {}
  twitter: {}
  github: {}
  google: {}
  linkedin: {}
)

###
Virtuals
###
UserSchema.virtual("password").set((password) ->
  @_password = password
  @salt = @makeSalt()
  @hashed_password = @encryptPassword(password)
  return
).get ->
  @_password


###
Validations
###
validatePresenceOf = (value) ->
  value and value.length


# the below 4 validations only apply if you are signing up traditionally
UserSchema.path("name").validate ((name) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  unless @provider
  typeof name is "string" and name.length > 0
), "Name cannot be blank"
UserSchema.path("email").validate ((email) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  unless @provider
  typeof email is "string" and email.length > 0
), "Email cannot be blank"
UserSchema.path("username").validate ((username) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  unless @provider
  typeof username is "string" and username.length > 0
), "Username cannot be blank"
UserSchema.path("hashed_password").validate ((hashed_password) ->
  
  # if you are authenticating by any of the oauth strategies, don't validate
  return true  unless @provider
  typeof hashed_password is "string" and hashed_password.length > 0
), "Password cannot be blank"

###
Pre-save hook
###
UserSchema.pre "save", (next) ->
  return next()  unless @isNew
  if not validatePresenceOf(@password) and not @provider
    next new Error("Invalid password")
  else
    next()
  return


###
Methods
###
UserSchema.methods =
  
  ###
  Authenticate - check if the passwords are the same
  
  @param {String} plainText
  @return {Boolean}
  @api public
  ###
  authenticate: (plainText) ->
    @encryptPassword(plainText) is @hashed_password

  
  ###
  Make salt
  
  @return {String}
  @api public
  ###
  makeSalt: ->
    crypto.randomBytes(16).toString "base64"

  
  ###
  Encrypt password
  
  @param {String} password
  @return {String}
  @api public
  ###
  encryptPassword: (password) ->
    return ""  if not password or not @salt
    salt = new Buffer(@salt, "base64")
    crypto.pbkdf2Sync(password, salt, 10000, 64).toString "base64"

mongoose.model "User", UserSchema