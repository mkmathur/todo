exports.signup = (passport) ->
	passport.authenticate('local-signup', {
			successRedirect: '/'
			failureFlash: true
		})

exports.login = (passport) ->
	passport.authenticate('local-login', {
			successRedirect: '/'
			failureFlash: true
		})

exports.logout = (req, res) ->
	req.logout()
	res.redirect('/')




		
