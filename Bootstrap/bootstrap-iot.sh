#!/bin/bash

echo "Be sure that you have already configured the AWS CLI with credentials!"

bucket="arose-iot-device-certs"
certDir="~/deviceSDK/certs"
certpaths[0]="gateway-private.pem.key"
certpaths[1]="gateway-public.pem.key"
certpaths[2]="gateway.pem.crt"
certpaths[3]="root-CA.pem.crt"

mkdir -p $certDir

for cert in ${certpaths[*]}; do
	aws s3 cp s3://$bucket/$cert $certDir
done