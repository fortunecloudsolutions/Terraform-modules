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
:hash: Provides an ECS task set - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|



# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `service  ` | `string` | true |  The short name or ARN of the ECS service. |
| `cluster ` | `string` | true|  The short name or ARN of the cluster that hosts the service to create the task set in. |
| `task_definition` | `string` | true|  The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. |
| `capacity_provider` | `string` | true|   The short name or full Amazon Resource Name (ARN) of the capacity provider. |
| `weight` | `string` | true| The relative percentage of the total number of launched tasks that should use the specified capacity provider. |
| `container_name` | `string` | true|  The name of the container to associate with the load balancer (as it appears in a container definition). |
| `subnets ` | `string` | true|  The subnets associated with the task or service. Maximum of 16. |
| `registry_arn` | `string` | true|  he ARN of the Service Registry. The currently supported service registry is Amazon Route 53 Auto Naming Service(aws_service_discovery_service resource).  |







# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `lease_seconds`                 | 3600                                                                                 |
| `backend`                       | aws                                                           |
| `role`                       | resources                                                           |
| `service`                          | aws_ecs_service.example.id                                           |
| `cluster`                          | matilda-sandbox-cluster                                           |
| `task_definition`                          | aws_ecs_task_definition.example.arn                                           |
| `load_balancer`                          | null                                           |








# *Verify the results in Output Section*
*Output

| Name          | Description |
| ------------- | ------------- |
| `arn`            | The Amazon Resource Name (ARN) that identifies the task set.               |
| `revision`            | Revision of the task in a particular family.               |
| `id`            |   The task_set_id, service and cluster separated by commas (,).            |
| `stability_status`            |   The stability status. This indicates whether the task set has reached a steady state.               |
| `status`            |   The status of the task set.|
| `tags_all`            |   A map of tags assigned to the resource, including those inherited from the provider                |
| `task_set_id`            |   The ID of the task set.                |






# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_set)