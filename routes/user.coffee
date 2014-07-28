exports.signup = (passport) ->
	passport.authenticate('local-signup', {
			successRedirect: '/'
			failureRedirect: '/signup'
			failureFlash: true
		})

exports.login = (passport) ->
	passport.authenticate('local-login', {
			successRedirect: '/'
			failureRedirect: '/login'
			failureFlash: true
		})

exports.logout = (req, res) ->
	req.logout()
	res.redirect('/')




		
