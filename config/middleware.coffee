exports.requiresLogin = (req, res, next) ->
	if req.isAuthenticated()
		next()
	else
		res.json {
			'response' : 'FAIL',
			'errors' : ['Sign in required.']
		}