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
:hash: Provides an ECS cluster capacity provider. 

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `auto_scaling_group`     | Provides a auto scaling group                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `auto_scaling_group_provider` | `string` | true | NConfiguration block for the provider for the ECS auto scaling group. |
| `name` | `string` | true| SName of the capacity provider. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `lease_seconds`                 | 3600                                                                                 |
| `backend`                       | aws|
| `role`                          | resources|
| `name`                          | test|
| `auto_scaling_group_provider`   | {
    "auto_scaling_group_arn"        : "arn:aws:autoscaling:us-east-2:046692759124:autoScalingGroup:5f47589e-65a1-4bf7-a658-bc2e51f3dfa5:autoScalingGroupName/ecstest",
    "managed_termination_protection" : "DISABLED",

    "managed_scaling" : {
      "maximum_scaling_step_size" : 1000,
      "minimum_scaling_step_size" : 1,
      "status"                    : "ENABLED",
      "target_capacity"           : 10,
      "instance_warmup_period"    : 300
    }
  }                                              |



# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `arn` | ARN that identifies the capacity provider. |
| `id` | ARN that identifies the capacity provider. |
| `tags_all` | Map of tags assigned to the resource, including those inherited from the provider. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider#attributes-reference)