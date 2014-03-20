"use strict"

charts = require("../controllers/charts")
module.exports = (app, passport) ->
  app.get "/create", charts.create