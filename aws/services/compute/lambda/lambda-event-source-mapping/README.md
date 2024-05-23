:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the software; 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Provides a Lambda event source mapping. This allows Lambda functions to get events from Kinesis, DynamoDB, SQS, Amazon MQ and Managed Streaming for Apache Kafka (MSK).

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |

| `function_name` | `string` | true| The name or the ARN of the Lambda function that will be subscribing to events. |
| `destination_arn` | `string` | true | The Amazon Resource Name (ARN) of the destination resource. |
| `endpoints` | `string` | true | A map of endpoints for the self managed source. For Kafka self-managed sources, the key should be KAFKA_BOOTSTRAP_SERVERS and the value should be a string with a comma separated list of broker endpoints. |
| `type` | `string` | true | The type of this configuration. For Self Managed Kafka you will need to supply blocks for type VPC_SUBNET and VPC_SECURITY_GROUP. |
| `uri` | `string` | true | The URI for this configuration. For type VPC_SUBNET the value should be subnet:subnet_id where subnet_id is the value you would find in an aws_subnet resource's id attribute. For type VPC_SECURITY_GROUP the value should be security_group:security_group_id where security_group_id is the value you would find in an aws_security_group resource's id attribute. |


# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `name`                   | testfunc1                                                                                 |
| `function_name`                        | test-lambda-function|
| `event_source_arn`                          | arn:aws:sqs:us-east-2:046692759124:test                                                                               |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `function_arn` | The the ARN of the Lambda function the event source mapping is sending events to. (Note: this is a computed value that differs from function_name above. |
|  `last_modified` |The date this resource was last modified. |
|  `last_processing_result` | The result of the last AWS Lambda invocation of your Lambda function. |
|  `state` | The state of the event source mapping. |
|  `state_processing_reason` | The reason the event source mapping is in its current state. |
|  `uuid` | The UUID of the created event source mapping. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping#attributes-reference)