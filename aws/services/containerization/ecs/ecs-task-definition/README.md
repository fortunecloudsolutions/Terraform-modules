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
:hash: Manages a revision of an ECS task definition to be used in aws_ecs_service.

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
| `container_definition  ` | `string` | true |  A list of valid container definitions provided as a single valid JSON document  . |
| `family ` | `string` | true|  A unique name for your task definition. |
| `name` | `string` | true|  Name of the volume. |
| `file_system_id` | `string` | true|   The Amazon FSx for Windows File Server file system ID to use. |
| `root_directory` | `string` | true| The directory within the Amazon FSx for Windows File Server file system to mount as the root directory inside the host. |
| `authorization_config` | `string` | true|  Configuration block for authorization for the Amazon FSx for Windows File Server file system detailed below. |
| `credentials_parameter ` | `string` | true|  The authorization credential option to use. |
| `domain` | `string` | true|  A fully qualified domain name hosted by an AWS Directory Service Managed Microsoft AD (Active Directory) or self-hosted AD on Amazon EC2. |
| `type` | `string` | true|  Type of constraint. Use memberOf to restrict selection to a group of valid candidates.  |
| `container_name` | `string` | true|  Name of the container that will serve as the App Mesh proxy. |
| `properties` | `string` | true|   Set of network configuration parameters to provide the Container Network Interface (CNI) plugin, specified a key-value mapping. |
| `size_in_gib ` | `string` | true|  The total amount, in GiB, of ephemeral storage to set for the task. |
| `device_name ` | `string` | true|  Elastic Inference accelerator device name.  |
| `device_type` | `string` | true|  Elastic Inference accelerator type to use. |







# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                        | us-east-2                                                                    | 
| `lease_seconds`                 | 3600                                                                                 |
| `backend`                       | aws                                                           |
| `role`                       | resources                                                           |
| `family`                          | service                                           |
| `value`                          |  [{\"name\":\"ECS1\",\"image\":\"nginx:latest\",\"cpu\":10,\"memory\":512,\"links\":[],\"portMappings\":[{\"containerPort\":80,\"hostPort\":8086,\"protocol\":\"http\"}],\"essential\":true,\"entryPoint\":[],\"command\":[],\"environment\":[],\"mountPoints\":[],\"volumesFrom\":[]}]                                                             |






# *Verify the results in Output Section*
*Output

| Name          | Description |
| ------------- | ------------- |
| `arn`            |  Full ARN of the Task Definition (including both family and revision).                |
| `revision`            | Revision of the task in a particular family.               |
| `tags_all`            |   Map of tags assigned to the resource, including those inherited from the provider                |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#attributes-reference)