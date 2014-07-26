# BASE SETUP

express = require 'express'
app = express()
port = process.env.PORT || 8080

mongoose = require 'mongoose'
passport = require 'passport'
flash = require 'connect-flash'

morgan = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
session = require 'express-session'

# CONFIGURE

require './config/db'
require('./config/passport')(passport)

# set up express application
app.use morgan 'dev'
app.use cookieParser()
app.use bodyParser()

# required for passport
app.use session { secret: 'mysecret' }
app.use passport.initialize()
app.use passport.session()
app.use flash()

# ROUTES

require('./routes/tasks')(app)
require('./routes/user')(app, passport)

# START THE SERVER
app.listen(port)
console.log('Magic happens on port ' + port)
