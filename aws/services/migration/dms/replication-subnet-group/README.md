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
:hash: Provides a DMS (Data Migration Service) replication subnet group resource. DMS replication subnet groups can be created, updated, deleted, and imported.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_subnet`             | Provides an VPC subnet resource.                                     |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | The AWS region for API calls. |
|:two: `replication_subnet_group_description` | `string` | true | The description for the subnet group. |
|:three: `replication_subnet_group_id` | `string` | true | The name for the replication subnet group. |
|:four: `subnet_ids` | `list` | true | A list of the EC2 subnet IDs for the subnet group. |


# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.


# *Example Input Values*
* Input

| Input value                             | Example values                                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------|
| `region`                                | us-east-2                                                                                | 
| `replication_subnet_group_description`  | Subnet Group for Backend DBS                                                             | 
| `replication_subnet_group_id`           | opsbackendgrp                                                                            | 
| `subnet_ids`                            | ["^#Subnet 1/subnet_id^","^#Subnet 2/subnet_id^"]                                        | 

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`vpc id` | The ID of the VPC the subnet group is in. |
|  :two:`replication_subnet_group_id` | The name for the replication subnet group. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



