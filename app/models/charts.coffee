"use strict"

###
Module dependencies.
###
mongoose = require("mongoose")
Schema = mongoose.Schema

###
Chart Schema
###
ChartSchema = new Schema(
  created:
    type: Date
    default: Date.now

  title:
    type: String
    default: ""
    trim: true

  dataSource:
    type: String
    default: ""

  user:
    type: Schema.ObjectId
    ref: "User"
)

###
Validations
###
ChartSchema.path("title").validate ((title) ->
  title.length
), "Title cannot be blank"

###
Statics
###
ChartSchema.statics.load = (id, cb) ->
  @findOne(_id: id).populate("user", "name username").exec cb
  return

mongoose.model "Chart", ChartSchema