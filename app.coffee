# BASE SETUP

express = require 'express'
app = express()
port = process.env.PORT || 8080
path = require 'path'

mongoose = require 'mongoose'
passport = require 'passport'
flash = require 'connect-flash'
morgan = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
session = require 'express-session'

middleware = require('./config/middleware')

# CONFIGURE

require './config/db'
require('./config/passport')(passport)

# set up express application
app.use morgan 'dev'
app.use cookieParser()
app.use bodyParser()

# view engine setup
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'jade')
app.use(express.static(__dirname + '/public'))

# required for passport
app.use session { secret: 'mysecret' }
app.use passport.initialize()
app.use passport.session()
app.use flash()

# ROUTES

require('./routes/routes')(app, passport)

# START THE SERVER
app.listen(port)
console.log('Magic happens on port ' + port)
