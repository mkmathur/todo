express = require 'express'

exports.home = (req, res) ->
	res.render('index.jade', {
			title: 'Todo',
			styles: ['css/landing.css']
		})

exports.login = (req, res) ->
	res.render('login.jade', {
			title: 'Login',
			styles: []
		})

exports.signup = (req, res) ->
	res.render('signup.jade', {
			title: 'Sign Up',
			styles: []
		})
