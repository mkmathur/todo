index = require './index' 
user = require './user' 
tasks = require './tasks' 
middleware = require './../config/middleware'

module.exports = (app, passport) ->

	# views
	app.route('/').get index.home
	app.route('/login').get index.login
	app.route('/signup').get index.signup

	# users
	app.route('/signup').post user.signup passport
	app.route('/login').post user.login passport
	app.route('/logout').get user.logout

	# tasks
	app.route('/api/tasks')
		.all middleware.requiresLogin
		.post tasks.add
		.get tasks.all