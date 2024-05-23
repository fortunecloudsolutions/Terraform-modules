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
:hash: Matilda Plugin/Service

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | The AWS region for API calls. |
|:two: `endpoint_id` | `string` | true | The database endpoint identifier. Must contain from 1 to 255 alphanumeric characters or hyphens. |
|:three: `engine_name` | `string` | true | The type of engine for the endpoint. |


# *Optional Parameters*
* `certificate_arn` : The Amazon Resource Name (ARN) for the certificate.
* `database_name` : The name of the endpoint database.
* `elasticsearch_settings` : Configuration block with Elasticsearch settings.
* `extra_connection_attributes` : Additional attributes associated with the connection.
* `kafka_settings` : Configuration block with Kafka settings.
* `kinesis_settings` : Configuration block with Kinesis settings.
* `kms_key_arn` : The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters.
* `mongodb_settings` : The password to be used to login to the endpoint database.
* `password` : The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).
* `port` : The port used by the endpoint database.
* `s3_settings` : 	Configuration block with S3 settings.
* `server_name` : 	The host name of the server.
* `service_access_role` : 	The Amazon Resource Name (ARN) used by the service access IAM role for dynamodb endpoints.
* `ssl_mode` : 	The SSL mode to use for the connection.
* `tags` : 	A map of tags to assign to the resource.
* `username` : 	The user name to be used to login to the endpoint database.

# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `database_name`                         | ^#Oracle RDS 2019/db_instance_name^                                                      | 
| `endpoint_id`                           | sourceendpoint                                                                           | 
| `engine_name`                           | oracle                                                                                   | 
| `extra_connection_attributes`           | useLogMinerReader=N;useBfile=Y;addSupplementalLogging=Y;                                 | 
| `port`                                  | 1521                                                                                     | 
| `username`                              | admin                                                                                    | 
| `server_name`                           | ^#Oracle RDS 2019/db_instance_address^                                                   | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`target_endpoint_arn` | The Amazon Resource Name (ARN) for the endpoint. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



