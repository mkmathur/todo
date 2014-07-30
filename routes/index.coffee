express = require 'express'

exports.home = (req, res) ->
	res.render('index.jade', {
			title: 'Todo',
			styles: ['css/landing.css']
		})

