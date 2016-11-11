var HTTP = require('http');
var awsIot = require('aws-iot-device-sdk');

const COUCH_PORT=9000;

var device = awsIot.device({
	// keyPath: "~/deviceSDK/certs/private.pem",
	// certPath: "~/deviceSDK/certs/gateway.cert",
	// caPath: "~/deviceSDK/certs/root-CA.cert",
	clientId: "HomeGateway",
	region: "us-west-2"
});

device.on('connect', function() {
	console.log('connect');
	device.subscribe('topic_1');
	device.publish('topic_2', JSON.stringify({ test_data: 1 }));
});

device.on('message', function(topic, payload) {
	console.log('message', topic, payload.toString());
})

function handleRequestCouch(request, response) {
	response.end("Triggered request to message couch device.\n" + request);
}

var couchServer = HTTP.createServer(handleRequestCouch);
couchServerlisten(COUCH_PORT, function() {
	console.log("Couch server initiated on localhost:%s", COUCH_PORT);
});