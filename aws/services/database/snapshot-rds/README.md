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
| `db_instance_identifier ` | `string` | true | The DB Instance Identifier from which to take the snapshot. |
|`db_snapshot_identifier ` | `string` | true |  The Identifier for the snapshot. |





# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `lease_seconds`                       | 7200                                      |
| `backend`                  |aws                                                          | 
| `role`                            | resources                                                                   | 
| `db_instance_identifier`                     | rdsmatridb0", "rdsmatridb1                                           | 
| `db_snapshot_identifier`                      | mysql-snap-ne                                             | 




# *Verify the results in Output Section*
# *Output*

|  `allocated_storage` | Specifies the allocated storage size in gigabytes (GB). |
|  `availability_zone` | Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot. |
|  `db_snapshot_arn` | he Amazon Resource Name (ARN) for the DB snapshot. |
|  `encrypted` | Specifies whether the DB snapshot is encrypted. |
|  `engine_version` | Specifies the version of the database engine. |
|  `engine` | Specifies the name of the database engine. |
|  `source_db_snapshot_identifier` | The DB snapshot Arn that the DB snapshot was copied from.It only has value in case of cross customer or cross region copy. |
|  `status` | Specifies the status of this DB snapshot. |
|  `storage_type` | Specifies the storage type associated with DB snapshot. |
|  `vpc_id` | Specifies the vpc type associated with DB snapshot. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_snapshot#argument-reference)
