express = require 'express'
User = require './../models/user'

module.exports = (app, passport) ->
	router = express.Router()

	router.post('/signup', passport.authenticate('local-signup', {
			successRedirect: '/user/success',
			failureRedirect: '/user/failure',
			failureFlash: true
		}))

	router.get('/success', (req, res) ->
			res.json('Success!')
		)

	router.get('/failure', (req, res) ->
			res.json('Failure')
		)

	app.use('/user', router)
		
