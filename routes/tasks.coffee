Task = require './../models/Task'

exports.add = (req, res) ->
	task = new Task()
	task.text = req.body.text
	task.userID = req.user._id
	# save the task and check for errors
	task.save (err) ->
		res.send err if err 
		res.json { message: 'Task created! ', text: task.text, userID: task.userID }

exports.all = (req, res) ->
	Task.find( { 'userID' : req.user._id }, (err, tasks) ->
		res.send err if err 
		res.json tasks
	)

exports.find= (req, res) ->
	Task.findOne( { '_id' : req.params.task_id, 'userID' : req.user._id }, (err, task) ->
		res.send err if err 
		res.json task
	)

exports.update = (req, res) ->
	Task.findOne( { '_id' : req.params.task_id, 'userID' : req.user._id }, (err, task) ->
		res.send err if err 
		task.text = req.body.text
		task.save (err) ->
			res.send err if err 
			res.json task
	)

exports.delete = (req, res) ->
	Task.remove( { '_id' : req.params.task_id, 'userID' : req.user._id }, (err, task) ->
		res.send err if err 
		res.json { message: 'Task deleted' }
	)
