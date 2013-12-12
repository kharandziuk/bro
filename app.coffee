express = require('express')
app = express()
stylus = require 'stylus'
nib = require 'nib'

compile = (str, path) ->
  return stylus(str)

styleLocation = "#{__dirname}/stylus"
cssLocation = "#{__dirname}/public"

console.log "#{__dirname}/views"
app.use stylus.middleware({
  debug: true,
  src: styleLocation,
  dest: cssLocation,
  compile:compile,
  #force:true
})
app.configure( ()->
    app.set('view engine', 'jade')
    app.engine('.html', require('jade').__express)
    app.set('views', "#{__dirname}/views")
    app.use('/static', express.static("#{__dirname}/public"))
)

app.get('/', (request, response)->
    response.render('index', youAreUsingJade: true)
    return
)
app.listen(3000)
console.log 'app listen'
