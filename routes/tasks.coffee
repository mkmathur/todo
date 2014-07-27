express = require 'express'
Task = require './../models/Task'

module.exports = (app, mw) ->
	router = express.Router() 
	router.use mw.requiresLogin

	router.route '/'
		# create a task 
		.post (req, res) ->
			task = new Task()
			task.text = req.body.text
			task.userID = req.user._id
			# save the task and check for errors
			task.save (err) ->
				res.send err if err 
				res.json { message: 'Task created! ', text: task.text, userID: task.userID }
		# get all the tasks
		.get (req, res) ->
			Task.find( { 'userID' : req.user._id }, (err, tasks) ->
				res.send err if err 
				res.json tasks
			)
	app.use('/tasks', router)

