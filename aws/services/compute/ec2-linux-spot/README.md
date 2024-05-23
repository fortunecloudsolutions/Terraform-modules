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
:hash: Provides an EC2 instance resource. This allows instances to be created, updated, and deleted.

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
|:one: `ami` | `string` | true | AMI to use for the instance. |
|:two: `key_name` | `string` | true| Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource. |
|:three: `tags` | `map` | false | A map of tags to assign to the resource. |

# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `ami`                             | ami-01e36b7901e884a10                                                                    | 
| `instance_type`                   | t2.small                                                                                 |
| `key_name`                        | Migration_Dev|

| `timeouts`                        | {"create":"10m","delete":"20m"}|

| `user_data`                        | yEvYmluL2Jhc2gKc3VkbyB5dW0gaW5zdGFsbCAteSB5dW0tdXRpbHMKc3VkbyB5dW0tY29uZmlnLW1hbmFnZXIgLS1hZGQtcmVwbyBodHRwczovL3JwbS5yZWxlYXNlcy5oYXNoaWNvcnAuY29tL1JIRUwvaGFzaGljb3JwLnJlcG8KeXVtIGluc3RhbGwgLXkgdGVycmFmb3Jt|

| `wait_for_fulfillment`                        | true|


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`arn` | The ARN of the instance. |
|  :two:`id` |The ID of the instance. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)