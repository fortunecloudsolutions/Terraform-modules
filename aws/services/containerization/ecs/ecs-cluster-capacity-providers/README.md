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
:hash: Manages the capacity providers of an ECS Cluster.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_ecs_cluster`        | Provides a aws_ecs_cluster                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `cluster_name ` | `string` | true | Name of the ECS cluster to manage capacity providers for. |
| `capacity_provider` | `string` | true| Name of the capacity provider. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `lease_seconds`                 | 3600                                                                                 |
| `backend`                       | aws                                                           |
| `role`                          | resources                                                             |
| `cluster_name`                                | matilda-sandbox-cluster                          |
| `capacity_providers`                          | ["FARGATE"]                          |
| `default_capacity_provider_strategy`          | {
      "base"             : 1,
      "weight"            : 100,
      "capacity_provider" : "FARGATE"
    }                                                                                                        |




# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` |  Same as cluster_name. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers#argument-reference)