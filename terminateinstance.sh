#!/bin/bash
PATH=$PATH:/opt/aws/bin
export PATH

EC2_HOME=/opt/aws/apitools/ec2
export EC2_HOME

JAVA_HOME=/usr/lib/jvm/jre
export JAVA_HOME

instance_id=`cat /tmp/ec2_instance.id`
echo 'Terminating ' $instance_id

ec2-terminate-instances --private-key ~/.ec2/pk.pem --cert ~/.ec2/cert.pem $instance_id && rm /tmp/ec2_instance.id

