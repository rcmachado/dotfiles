#!/bin/bash
#
# AWS command line tools
#
# We also need to set EC2_CERT and EC2_PRIVATE_KEY - but don't set them
# here as each project has it's own credentials.
# For some other tools (like CloudFormation, for example), also set the
# AWS_CREDENTIAL_FILE variable.
#

PREFIX="/usr/local/Library/LinkedKegs"
export JAVA_HOME="$(/usr/libexec/java_home)"

export EC2_HOME="$PREFIX/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="$PREFIX/ec2-ami-tools/jars"
export AWS_AUTO_SCALING_HOME="$PREFIX/auto-scaling/jars"
export AWS_CLOUDFORMATION_HOME="$PREFIX/aws-cfn-tools/jars"
export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
export AWS_ELASTICACHE_HOME="$PREFIX/aws-elasticache/jars"
export AWS_IAM_HOME="$PREFIX/aws-iam-tools/jars"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
