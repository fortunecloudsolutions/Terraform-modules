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
:hash: Provides an ECS service - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).

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
| `weight  ` | `string` | true | Relative percentage of the total number of launched tasks that should use the specified capacity provider. |
| `capacity_provider` | `string` | true| Short name of the capacity provider. |
| `enable` | `string` | true| Whether to enable the deployment circuit breaker logic for the service. |
| `rollback` | `string` | true| Whether to enable Amazon ECS to roll back the service if a service deployment fails.  |
| `elb_name` | `string` | true| Name of the ELB (Classic) to associate with the service. |
| `target_group_arn` | `string` | true| ARN of the Load Balancer target group to associate with the service. |
| `container_port` | `string` | true|Port on the container to associate with the load balancer.. |
| `subnets` | `string` | true| Subnets associated with the task or service. |
| `type` | `string` | true| Type of constraint. The only valid values at this time are memberOf and distinctInstance. |
| `registry_arn` | `string` | true| ARN of the Service Registry. |
| `container_name` | `string` | true| Name of the container to associate with the load balancer (as it appears in a container definition). |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `component`                 | 3600                                                                                 |
| `deployment_identifier`                       | production                                                           |
| `cluster_name`                       | production                                                           |
| `ami_name_filter`                          | amzn2-ami-ecs-hvm-*-x86_64-ebs                                            |
| `cluster_instance_type`                          | t2.medium                                                             |
| `security_group`                          | sg-8ab03be1                                                             |
| `public_ip`                          | true                                                             |
| `block_device_size`                          | 60                                                             |
| `key_name`                          | Matri                                                             |
| `block_device_type`                          | standard                                                             |
| `subnet_ids`                          | subnet-3145b44b","subnet-34c4ea79                                       |
| `min_size`                          | 1                                                             |
| `max_size`                          | 10                                                             |
| `capacity`                          | 3                                                             |
| `scaling_custom_tags`                          | {
    "DeploymentIdentifier" :"123",
    "Name" : "cluster-worker",
    "Component" : "Matri-component",
    "ClusterName" :"services"
  }                                                             |
| `cluster_custom_tags`                                | matilda-sandbox-cluster                          |
| `{
    "DeploymentIdentifier" : "Matri_cluster"

  }`                                                                     | 




# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `cluster` |  Amazon Resource Name (ARN) of cluster which the service runs on. |
| `desired_count` |  Number of instances of the task definition. |
| `iam_role` |  ARN of IAM role used for ELB. |
| `name` |  Name of the service. |
| `id` |  ARN that identifies the service. |
| `tags_all` |  A map of tags assigned to the resource, including those inherited from the provider. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#attributes-reference)