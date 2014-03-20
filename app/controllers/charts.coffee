"use strict"
exports.create = (req, res) ->
  res.render "chart/create",
    title: "Create"
    user: (if req.user then JSON.stringify(req.user) else "null")