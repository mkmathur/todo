express = require 'express'

exports.home = (req, res) ->
	res.render('home.jade', {
			title: 'Todo',
			styles: ['css/landing.css']
		})

exports.tasks = (req, res) ->
	res.render('tasks.jade', {
			title: 'Todo',
			styles: ['css/main.css']
		})

