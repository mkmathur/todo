exports.requiresLogin = (req, res, next) ->
	if req.isAuthenticated()
		next()
	else
		res.redirect('/')