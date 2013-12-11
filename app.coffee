express = require('express')
app = express()
stylus = require 'stylus'
nib = require 'nib'

compile = (str, path) ->
  stylus(str).set('filename', path).use(nib())
    

console.log "#{__dirname}/views"
app.configure( ()->
    app.set('view engine', 'jade')
    app.engine('.html', require('jade').__express)
    app.set('views', "#{__dirname}/views")
    app.use stylus.middleware(src: "#{__dirname}/public", compile:compile)
    app.use('/static', express.static("#{__dirname}/public"))
)

app.get('/', (request, response)->
    response.render('index', youAreUsingJade: true)
    return
)
app.listen(3000)
console.log 'app listen'
