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
:hash: Provides a DMS (Data Migration Service) replication instance resource. DMS replication instances can be created, updated, deleted, and imported.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_security_group`     | Provides a security group resource.                                  |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | The AWS region for API calls. |
|:two: `replication_instance_class` | `string` | true | The compute and memory capacity of the replication instance as specified by the replication instance class.  |
|:three: `replication_instance_id` | `string` | true | The replication instance identifier. |
|:four: `replication_subnet_group_id` | `string` | true |  A subnet group to associate with the replication instance. |


# *Optional Parameters*
* `allocated_storage` : The amount of storage (in gigabytes) to be initially allocated for the replication instance.
* `allow_major_version_upgrade` : Indicates that major version upgrades are allowed.
* `apply_immediately` : Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource.
* `auto_minor_version_upgrade` : Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window.
* `availability_zone` : The EC2 Availability Zone that the replication instance will be created in.
* `engine_version` : The engine version number of the replication instance.
* `kms_key_arn` : The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters.
* `multi_az` : Specifies if the replication instance is a multi-az deployment.
* `preferred_maintenance_window` : The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC).
* `publicly_accessible` : Specifies the accessibility options for the replication instance.
* `tags` : 	A map of tags to assign to the resource.
* `vpc_security_group_ids` : 	A list of VPC security group IDs to be used with the replication instance.


# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `allocated_storage`                     | 50                                                                                       | 
| `allow_major_version_upgrade`           | false                                                                                    | 
| `multi_az`                              | true                                                                                     | 
| `publicly_accessible`                   | true                                                                                     | 
| `replication_instance_class`            | dms.t3.medium                                                                            | 
| `replication_instance_id`               | opsdbreplinstance                                                                        |
| `replication_subnet_group_id`           | ^#Replication Subnet Group/replication_subnet_group_id^                                  | 
| `vpc_security_group_ids`                | ["^#DB Security Group/sg_id^"]                                                           |  


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`replication_instance_arn` | The Amazon Resource Name (ARN) of the replication instance. |
|  :two:`replication_instance_private_ips` | A list of the private IP addresses of the replication instance. |
|  :three:`replication_instance_public_ips` | A list of the public IP addresses of the replication instance. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



