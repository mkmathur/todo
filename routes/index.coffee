express = require 'express'

exports.home = (req, res) ->
	res.render('index.jade', {
			title: 'Todo'
		})

exports.login = (req, res) ->
	res.render('login.jade', {
			title: 'Login'
		})

exports.signup = (req, res) ->
	res.render('signup.jade', {
			title: 'Sign Up'
		})
