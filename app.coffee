express = require('express')
app = express()

console.log "#{__dirname}/views"
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
