var http = require('http');

const COUCH_PORT=9000;

function handleRequestCouch(request, response) {
	response.end("Triggered request to message couch device.\n" + request);
}

var couchServer = http.createServer(handleRequestCouch);
couchServerlisten(COUCH_PORT, function() {
	console.log("Couch server initiated on localhost:%s", COUCH_PORT);
});