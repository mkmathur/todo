exports.signup = (passport) ->
	passport.authenticate('local-signup', {
			successRedirect: '/tasks'
			failureFlash: true
		})

exports.login = (passport) ->
	passport.authenticate('local-login', {
			successRedirect: '/tasks'
			failureFlash: true
		})

exports.logout = (req, res) ->
	req.logout()
	res.redirect('/')




		
