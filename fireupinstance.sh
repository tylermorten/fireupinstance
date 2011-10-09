#!/bin/bash
PATH=$PATH:/opt/aws/bin
export PATH

EC2_HOME=/opt/aws/apitools/ec2
export EC2_HOME

JAVA_HOME=/usr/lib/jvm/jre
export JAVA_HOME


export instance_id=`ec2-run-instances <ami_here> --private-key ~/.ec2/pk.pem --cert ~/.ec2/cert.pem -g <description> -k key -t m1.small | grep INSTANCE | awk '{print $2}'`

echo $instance_id > /tmp/ec2_instance.id

sleep 60 && ec2-associate-address --private-key ~/.ec2/pk.pem --cert ~/.ec2/cert.pem <ip_here> -i $instance_id 

