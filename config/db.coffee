mongoose = require 'mongoose'

# local database
dbURI = 'mongodb://localhost/todo'

# heroku database
# dbURI = process.env.MONGOLAB_URI ||process.env.MONGOHQ_URL 

mongoose.connect dbURI
db = mongoose.connection

db.on('error', (err) -> console.error('connection error: %s', err))
db.once('open', -> console.log('connected to db'))
db.on('disconnected', -> console.log('disconnected from db'))

require './../models/task'

