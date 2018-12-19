#!/bin/bash

LOG_PATH='/var/log/nginx'
LOG_GLOB='www.kidzworld.com.access.log*gz'
BUCKET_NAME='kw-nginx-access-logs'
AWS_CLI='/usr/bin/aws'

# Iterate over all log files matching regex in path
for filepath in `ls $LOG_PATH/$LOG_GLOB`
do
 # Check if is file
 [[ -e $filepath ]] || continue

 log_filename="$(hostname)_$(basename $filepath)"

 AWS_ACCESS_KEY_ID=<%= node[:s3][:aws_access_key_id] %> AWS_SECRET_ACCESS_KEY=<%= node[:s3][:aws_secret_access_key] %> $AWS_CLI s3 cp $filepath s3://$BUCKET_NAME/$log_filename
 rm $filepath
done
