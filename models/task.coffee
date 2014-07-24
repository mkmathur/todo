mongoose = require 'mongoose'
Schema = mongoose.Schema
uniqueValidator = require 'mongoose-unique-validator'

TaskSchema = new Schema {
	text: String,
	completed: Boolean
}

module.exports = mongoose.model('Task', TaskSchema)