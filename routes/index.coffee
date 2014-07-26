express = require 'express'
User = require './../models/user'

module.exports = (app, passport) ->
	router = express.Router()

	router.get('/', (req, res) ->
			res.json('Welcome!')
		)

	router.post('/signup', passport.authenticate('local-signup', {
			successRedirect: '/success',
			failureRedirect: '/failure',
			failureFlash: true
		}))

	router.post('/login', passport.authenticate('local-login', {
			successRedirect: '/success',
			failureRedirect: '/failure',
			failureFlash: true
		}))

	router.get('/logout', (req, res) ->
			req.logout()
			res.redirect('/')
		)

	router.get('/success', (req, res) ->
			res.json('Success!')
		)

	router.get('/failure', (req, res) ->
			res.json('Failure')
		)

	app.use('/', router)
		
