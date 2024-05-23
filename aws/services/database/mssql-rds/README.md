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
:hash: Provides an RDS instance resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_subnet`             | Provides an VPC subnet resource.                                     |
| `aws_security_group`     | Provides a security group resource.                                  |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | The AWS region for API calls. |
|:`subnet_id` | `list` | true | The list of VPC Subnet ID to launch in. |
| `security_group` | `list` | true | A list of security group IDs to associate with. |
| `engine_name` | `string` | true | Specifies the name of the engine that this option group should be associated with. |
| `identifier` | `string` | true | The identifier of the resource |
| `allow_major` | `bool` | true | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible. |
|`allow_minor` | `bool` | true | Indicates that minor version upgrades are allowed. |
| `engine_version` | `string` | true | Engine Version |
| `instance` | `string` | true | The instance type of the RDS instance. |
| `storage` | `number` | true | The allocated storage in gibibytes. |
| `username` | `string` | true | Username for the master DB user. |
| `password` | `string` | true | Password for the master DB user. |
| `port` | `string` | true | The port on which the DB accepts connections. |
| `multi_az` | `bool` | true | Specifies if the RDS instance is multi-AZ |
| `backup_retention_period` | `number` | true | The days to retain backups for. Must be between 0 and 35 |
| `copy_tags_to_snapshot` | `bool` | true | Copy all Instance tags to snapshots |
| `onitoring_interval` | `number` | true | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. |
|`publicly_accessible` | `bool` | true |  Bool to control if instance is publicly accessible |
| `storage_type` | `string` | true | One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). |
| `skip_final_snapshot` | `bool` | true |  Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. |
| `license_model` | `string` | true |  License model information for this DB instance. |


# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.
* `storage_encrypted` : Specifies whether the DB instance is encrypted.


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `subnet_id`                       | ["^#Subnet 1/subnet_id^", "^#Subnet 2/subnet_id^"]                                       |
| `security_group`                  | ["^#DB Security Group/sg_id^"]                                                           | 
| `tags`                            | {"Name":"Operations"}                                                                    | 
| `engine_name`                     | oracle-ee                                                                                | 
| `identifier`                      | operationsdboracle                                                                       | 
| `allow_major`                     | true                                                                                     | 
| `allow_minor`                     | true                                                                                     | 
| `engine_version`                  | 19.0.0.0.ru-2020-10.rur-2020-10.r1                                                       | 
| `instance`                        | db.t3.medium                                                                             | 
| `storage`                         | 20                                                                                       | 
| `storage_encrypted`               | true                                                                                     | 
| `username`                        | user                                                                                     | 
| `password`                        | 12345                                                                                    | 
| `port`                            | 1591                                                                                     | 
| `multi_az`                        | true                                                                                     | 
| `backup_retention_period`         | 0                                                                                        | 
| `copy_tags_to_snapshot`           | true                                                                                     | 
| `monitoring_interval`             | 0                                                                                        | 
| `publicly_accessible`             | true                                                                                     | 
| `storage_type`                    | gp2                                                                                      | 
| `skip_final_snapshot`             | true                                                                                     | 
| `license_model`                   | bring-your-own-license                                                                   | 
| `timeouts`                        | {"create":"90m","delete":"90m","update":"90m"}                                           | 



# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `db_instance_address` | The address of the RDS instance |
|  `db_instance_arn` | The ARN of the RDS instance |
|  `db_instance_availability_zone` | The availability zone of the RDS instance |
|  `db_instance_endpoint` | The connection endpoint |
|  `db_instance_id` | The RDS instance ID |
|  `db_instance_resource_id` | The RDS Resource ID of this instance |
|  `db_instance_status` | The RDS instance status |
|  `db_instance_name` | The database name |
|  `db_instance_username` | The master username for the database |
|  `db_instance_port` | The database port |
|  `this_db_subnet_group_arn` | The ARN of the db subnet group |
|  `this_db_parameter_group_id` | The db parameter group id |
|  `db_parameter_group_arn` | The ARN of the db parameter group |
|  `db_instance_domain` | The ID of the Directory Service Active Directory domain the instance is joined to |
|  `db_instance_domain_iam_role_name` | The name of the IAM role to be used when making API calls to the Directory Service. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_option_group)
