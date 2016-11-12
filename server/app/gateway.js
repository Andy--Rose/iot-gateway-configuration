var Express = require('express');
var awsIot = require('aws-iot-device-sdk');

const GATEWAY = Express();
const COUCH_PORT=9000;

var device = awsIot.device({
	keyPath: "~/deviceSDK/certs/private.pem",
	certPath: "~/deviceSDK/certs/gateway.cert",
	caPath: "~/deviceSDK/certs/root-CA.cert",
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


GATEWAY.get('/', function(request, response) {
	response.end("Triggered request to message couch device.\n" + request);
})

GATEWAY.listen(COUCH_PORT, function(err) {
	if (err) {
		console.log("ERROR $tstamp " + err);
	}

	console.log("server is listening on port " + COUCH_PORT)
})