"use strict"

###
Module dependencies.
###
mongoose = require("mongoose")
User = mongoose.model("User")

###
Auth callback
###
exports.authCallback = (req, res) ->
  res.redirect "/"
  return


###
Show login form
###
exports.signin = (req, res) ->
  res.render "users/signin",
    title: "Sign in"
    message: req.flash("error")

  return


###
Show sign up form
###
exports.signup = (req, res) ->
  res.render "users/signup",
    title: "Sign up"
    user: new User()

  return


###
Logout
###
exports.signout = (req, res) ->
  req.logout()
  res.redirect "/"
  return


###
Session
###
exports.session = (req, res) ->
  res.redirect "/"
  return


###
Create user
###
exports.create = (req, res, next) ->
  user = new User(req.body)
  message = null
  user.provider = "local"
  user.save (err) ->
    if err
      switch err.code
        when 11000, 11001
          message = "Username already exists"
        else
          message = "Please fill all the required fields"
      return res.render("users/signup",
        message: message
        user: user
      )
    req.logIn user, (err) ->
      return next(err)  if err
      res.redirect "/"

    return

  return


###
Send User
###
exports.me = (req, res) ->
  res.jsonp req.user or null
  return


###
Find user by id
###
exports.user = (req, res, next, id) ->
  User.findOne(_id: id).exec (err, user) ->
    return next(err)  if err
    return next(new Error("Failed to load User " + id))  unless user
    req.profile = user
    next()
    return

  return