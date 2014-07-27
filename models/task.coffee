mongoose = require 'mongoose'
Schema = mongoose.Schema

TaskSchema = new Schema {
	text: String,
	completed: Boolean,
	userID: String
}

module.exports = mongoose.model('Task', TaskSchema)