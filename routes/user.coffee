express = require 'express'
User = require './../models/user'

module.exports = (app, passport) ->
	router = express.Router()

	router.post('/signup', passport.authenticate('local-signup', {
			successRedirect: '/success',
			failureRedirect: '/failure',
			failureFlash: true
		}))

	app.use('/user', router)
		
