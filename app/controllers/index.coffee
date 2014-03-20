"use strict"
exports.render = (req, res) ->
  res.render "index",
    title: "Home"
    user: (if req.user then JSON.stringify(req.user) else "null")