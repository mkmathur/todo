# BASE SETUP

express = require 'express'
app = express()
bodyParser = require 'body-parser'

# CONFIGURE

app.use bodyParser.urlencoded( {extended: true} )
port = process.env.PORT || 8080
db = require './config/db'

# ROUTES

router = express.Router() # an instance of the express router

# test route to make sure everything is working (accessed at GET http://localhost:8080/api)
router.get('/', (req, res) ->
		res.json { message: 'hooray! welcome to our api!'}
	)

# REGISTER OUR ROUTES 
# all routes will be prefixed with /api
app.use('/api', router)

# START THE SERVER
app.listen(port)
console.log('Magic happens on port ' + port)
