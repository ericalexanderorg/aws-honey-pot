### Summary

AWS Honey Pot is a tool to launch server-less honey pot services in AWS, detect their access, and alert. 

### Features

- Create S3 buckets
- Create Lambda function that receives S3 access logs and forwards relevant logs

### Road Map

- Utilize API Gateway to mimic common web apps
- Utilize Elasticsearch Service
- Provision certs, either from Amazon or Let's Encrypt. Certs are easily discoverable and should attract recon activity.
- Utilize troposphere to create complex & dynamic CloudFormation templates

### How To

The template.json file is an AWS CloudFormation template that can be used to launch a stack. 

The template has 2 variables:
- domain: A string, most likely the base string of your domain, that will be used to create buckets in the format domain-x (ie: ericalexander-administrator)
- alerturl: URL where matching hits are posted to. This should be your SEIM.

CloudFormation isn't forgiving if an S3 bucket already exists. Use check-buckets.sh to test if the pre-defined buckets already exist. 
