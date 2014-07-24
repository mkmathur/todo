# BASE SETUP

express = require 'express'
app = express()
bodyParser = require 'body-parser'
mongoose = require 'mongoose'
Task = require './models/Task'

# CONFIGURE

app.use bodyParser.urlencoded( {extended: true} )
port = process.env.PORT || 8080
db = require './config/db'

# ROUTES

router = express.Router() 

# test route to make sure everything is working (accessed at GET http://localhost:8080/api)
router.get('/', (req, res) ->
		res.json { message: 'hooray! welcome to our api!'}
	)

router.route '/tasks'
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

# REGISTER OUR ROUTES 
# all routes will be prefixed with /api
app.use('/api', router)

# START THE SERVER
app.listen(port)
console.log('Magic happens on port ' + port)
