express = require 'express'

module.exports = (app, passport) ->
	router = express.Router()

	router.get('/', (req, res) ->
		res.render('index.jade', {
			title: 'Todo'
		})
	)

	app.use('/', router)