exports.signup = (passport) ->
	passport.authenticate('local-signup', {
			successRedirect: '/',
			failureRedirect: '/home',
			failureFlash: true
		})

exports.login = (passport) ->
	passport.authenticate('local-login', {
			successRedirect: '/',
			failureRedirect: '/home',
			failureFlash: true
		})

exports.logout = (req, res) ->
	req.logout()
	res.redirect('/')




		
