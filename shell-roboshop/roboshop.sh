#!/bin/bash

AMI_ID="ami-0220d79f3f480ecf5"
SG_ID="sg-0629e944a73597de8"
SUBNET_ID="subnet-040e46e23d5653bd4"

ZONE_ID="Z06008633JIHZ67B3RC4Q"
DOMAIN_NAME="kimidi.site"

INSTANCES=("mongodb")

for instance in "$@"
do

    INSTANCE_ID=$(aws ec2 run-instances --image-id "$AMI_ID" --instance-type t3.micro --subnet-id "$SUBNET_ID" --security-group-ids "$SG_ID" --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" --query "Instances[0].InstanceId" --output text)

    if [ $? -ne 0 ] || [ -z "$INSTANCE_ID" ]; then
        echo "ERROR: Failed to create $instance instance"
        exit 1
    fi

    echo "$instance instance created: $INSTANCE_ID"

    if [ "$instance" != "frontend" ]
    then
        IP=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query "Reservations[0].Instances[0].PrivateIpAddress" --output text)

        RECORD_NAME="$instance.$DOMAIN_NAME"

    else

        IP=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query "Reservations[0].Instances[0].PublicIpAddress" --output text)

        RECORD_NAME="$instance.$DOMAIN_NAME"

    fi

    echo "$instance IP address: $IP"

    aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \
    --change-batch '
    {
        "Comment": "Creating or Updating a record set for cognito endpoint"
        ,"Changes": [{
        "Action"              : "UPSERT"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$RECORD_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP'"
            }]
        }
        }]
    }'

done