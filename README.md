# IoT Gateway

## Summary
This Node.js application is built to run on a Raspberry Pi and work as a web server that accepts IoT traffic from AWS. This device works as a gateway that sends signals to other devices over radio frequency. 

## Installation & Setup

### AWS IoT
1. Register device on AWS console
2. Download a connection kit
3. Configure and test the device
TODO

## Design

### Front End
Front end is a web-based react application running from my personal site at andyrrose.com/lights.html. Every device configured on the site must also be configured in this application in order to work. The selected device on the front end will determine the port by which the request goes to the device.

### Authentication
TODO
To prevent people from screwing with lights in my home, AWS Cognito will authenticate user's Google credentials to AWS. To grant access, user must have an AWS account. 

### Request Path
TODO

