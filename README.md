# Flaskgreeting

[Deploying a Flask application to Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create-deploy-python-flask.html)


## Installation

Create EB application:

```bash
eb init -p python-3.12 flaskgreeting --region eu-central-1
```

Add ssh keys to EC2 instalce created during environment setup:

```bash
eb init
```

Finally create the environment:

```bash
eb create flaskgreeting-env
Creating application version archive "app-ef4c-250131_145114855400".
Uploading flaskgreeting/app-ef4c-250131_145114855400.zip to S3. This may take a while.
Upload Complete.
Environment details for: flaskgreeting-env
  Application name: flaskgreeting
  Region: eu-central-1
  Deployed Version: app-ef4c-250131_145114855400
  Environment ID: e-pu6srhfmug
  Platform: arn:aws:elasticbeanstalk:eu-central-1::platform/Python 3.12 running on 64bit Amazon Linux 2023/4.4.0
  Tier: WebServer-Standard-1.0
  CNAME: UNKNOWN
  Updated: 2025-01-31 13:51:18.764000+00:00
Printing Status:
2025-01-31 13:51:17    INFO    createEnvironment is starting.
2025-01-31 13:51:18    INFO    Using elasticbeanstalk-eu-central-1-433861761153 as Amazon S3 storage bucket for environment data.
2025-01-31 13:51:40    INFO    Created security group named: sg-05f0c1e07d55e3d10
2025-01-31 13:51:55    INFO    Created target group named: arn:aws:elasticloadbalancing:eu-central-1:433861761153:targetgroup/awseb-AWSEB-TFSZZWIU9FAR/0ebf4de10dfceac8
2025-01-31 13:51:55    INFO    Created security group named: awseb-e-pu6srhfmug-stack-AWSEBSecurityGroup-3hSaDagaB91K
2025-01-31 13:52:26    INFO    Created Auto Scaling group named: awseb-e-pu6srhfmug-stack-AWSEBAutoScalingGroup-TMbrfzkT8Qs9
2025-01-31 13:52:26    INFO    Waiting for EC2 instances to launch. This may take a few minutes.
2025-01-31 13:52:26    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:eu-central-1:433861761153:scalingPolicy:64775d24-abef-4034-8ad9-1559fdd191a1:autoScalingGroupName/awseb-e-pu6srhfmug-stack-AWSEBAutoScalingGroup-TMbrfzkT8Qs9:policyName/awseb-e-pu6srhfmug-stack-AWSEBAutoScalingScaleUpPolicy-qzhNzYmN4GJE
2025-01-31 13:52:26    INFO    Created Auto Scaling group policy named: arn:aws:autoscaling:eu-central-1:433861761153:scalingPolicy:d94165af-a8da-4f60-b2db-b61b9cf4058a:autoScalingGroupName/awseb-e-pu6srhfmug-stack-AWSEBAutoScalingGroup-TMbrfzkT8Qs9:policyName/awseb-e-pu6srhfmug-stack-AWSEBAutoScalingScaleDownPolicy-alS9PslMSw5q
2025-01-31 13:52:26    INFO    Created CloudWatch alarm named: awseb-e-pu6srhfmug-stack-AWSEBCloudwatchAlarmLow-pYBr29eVqn1J
2025-01-31 13:52:26    INFO    Created CloudWatch alarm named: awseb-e-pu6srhfmug-stack-AWSEBCloudwatchAlarmHigh-4jCRJAIlb1pH
2025-01-31 13:54:46    INFO    Created load balancer named: arn:aws:elasticloadbalancing:eu-central-1:433861761153:loadbalancer/app/awseb--AWSEB-owJoODAeDBkg/1f7d474cec570ac8
2025-01-31 13:54:46    INFO    Created Load Balancer listener named: arn:aws:elasticloadbalancing:eu-central-1:433861761153:listener/app/awseb--AWSEB-owJoODAeDBkg/1f7d474cec570ac8/5e9401cbe7ada78a
2025-01-31 13:54:53    INFO    Instance deployment successfully generated a 'Procfile'.
2025-01-31 13:54:58    INFO    Instance deployment completed successfully.
2025-01-31 13:55:32    INFO    Application available at flaskgreeting-env.eba-mcxzd4xf.eu-central-1.elasticbeanstalk.com.
2025-01-31 13:55:32    INFO    Successfully launched environment: flaskgreeting-env
```

Environment creation takes about 5 minutes and creates the following resources:

- EC2 instance – An Amazon Elastic Compute Cloud (Amazon EC2) virtual machine configured to run web apps on the platform that you choose.

- Each platform runs a specific set of software, configuration files, and scripts to support a specific language version, framework, web container, or combination of these. Most platforms use either Apache or NGINX as a reverse proxy that sits in front of your web app, forwards requests to it, serves static assets, and generates access and error logs.

- Instance security group – An Amazon EC2 security group configured to allow inbound traffic on port 80. This resource lets HTTP traffic from the load balancer reach the EC2 instance running your web app. By default, traffic isn't allowed on other ports.

- Load balancer – An Elastic Load Balancing load balancer configured to distribute requests to the instances running your application. A load balancer also eliminates the need to expose your instances directly to the internet.

- Load balancer security group – An Amazon EC2 security group configured to allow inbound traffic on port 80. This resource lets HTTP traffic from the internet reach the load balancer. By default, traffic isn't allowed on other ports.

- Auto Scaling group – An Auto Scaling group configured to replace an instance if it is terminated or becomes unavailable.

- Amazon S3 bucket – A storage location for your source code, logs, and other artifacts that are created when you use Elastic Beanstalk.

- Amazon CloudWatch alarms – Two CloudWatch alarms that monitor the load on the instances in your environment and that are triggered if the load is too high or too low. When an alarm is triggered, your Auto Scaling group scales up or down in response.

- AWS CloudFormation stack – Elastic Beanstalk uses AWS CloudFormation to launch the resources in your environment and propagate configuration changes. The resources are defined in a template that you can view in the AWS CloudFormation console.

- Domain name – A domain name that routes to your web app in the form subdomain.region.elasticbeanstalk.com.


### Cleanup

```bash

```

