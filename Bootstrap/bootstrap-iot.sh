#!bin/bash

echo "Be sure that you have already configured the AWS CLI with credentials!"

bucket="arose-iot-device-certs"
certDir="~/deviceSDK/certs"
certs[0]="gateway-private.pem.key"
certs[1]="gateway-public.pem.key"
certs[2]="gateway.pem.crt"
certs[3]="root-CA.pem.crt"

mkdir -p $certDir

for cert in certs; do
	aws s3 cp s3://$bucket/$cert $certDir
done