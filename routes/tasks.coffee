express = require 'express'
Task = require './../models/Task'

module.exports = (app) ->
	router = express.Router() 

	router.route '/'
		# create a task 
		.post (req, res) ->
			task = new Task()
			task.text = req.body.text

			# save the task and check for errors
			task.save (err) ->
				res.send err if err 
				res.json { message: 'Task created! '}
		# get all the tasks
		.get (req, res) ->
			Task.find (err, tasks) ->
				res.send err if err 
				res.json tasks

	app.use('/tasks', router)

