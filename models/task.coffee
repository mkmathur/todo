mongoose = require 'mongoose'
Schema = mongoose.Schema

TaskSchema = new Schema {
	text: String,
	completed: Boolean
}

module.exports = mongoose.model('Task', TaskSchema)