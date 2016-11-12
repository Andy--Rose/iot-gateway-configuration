// content of index.js
const Express = require('express')  
const App = Express()
const Port = 3000

App.use(function(request, response, next) {
	console.log(request.headers)
	next()
})

App.use(function(request, response, next) {
	request.chance = Math.random()
	next()
})

App.get('/', function(request, response) {
	response.json({
		chance: request.chance,
		content: 'Hello from Express!'
	})
})

App.listen(Port, function(err) {  
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log("server is listening on port " + Port)
})