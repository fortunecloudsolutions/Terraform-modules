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
:hash: Manages an individual ECS resource tag. This resource should only be used in cases where ECS resources are created outside Terraform (e.g., ECS Clusters implicitly created by Batch Compute Environments).

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_batch_compute_environment`        | Provides a aws_batch_compute_environment                                 |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `resource_arn  ` | `string` | true | Amazon Resource Name (ARN) of the ECS resource to tag. |
| `key` | `string` | true|  Tag name. |
| `value` | `string` | true|  Tag value. |





# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `lease_seconds`                 | 3600                                                                                 |
| `backend`                       | aws                                                           |
| `role`                       | resources                                                           |
| `resource_arn`                          | arn:aws:ecs:us-east-2:046692759124:cluster/ecstest                                            |
| `key`                          | t2.Name                                                             |
| `value`                          | Hello World                                                             |






# *Verify the results in Output Section*
*Output

| Name          | Description |
| ------------- | ------------- |

| `id`            |  ECS resource identifier and key, separated by a comma (,)                |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_tag)