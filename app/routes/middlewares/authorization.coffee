"use strict"

###
Generic require login routing middleware
###
exports.requiresLogin = (req, res, next) ->
  return res.send(401, "User is not authorized")  unless req.isAuthenticated()
  next()
  return