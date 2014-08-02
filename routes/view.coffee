express = require 'express'

exports.home = (req, res) ->
	res.render('home.jade', {
			title: 'Todo',
			styles: ['css/landing.css', 'bootstrap-validator/dist/css/bootstrapValidator.min.css'],
			javascripts: ['bootstrap-validator/dist/js/bootstrapValidator.min.js', 'validate.js']
		})

exports.tasks = (req, res) ->
	res.render('tasks.jade', {
			title: 'Todo',
			styles: ['css/main.css'],
			javascripts: []
		})

