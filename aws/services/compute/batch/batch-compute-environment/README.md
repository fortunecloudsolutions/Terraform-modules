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
:hash: Creates a AWS Batch compute environment. Compute environments contain the Amazon ECS container instances that are used to run containerized batch jobs.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `name` | `string` | true | Region-unique name for the AMI.                                                        |
| `service_role` | `string` | true| The full Amazon Resource Name (ARN) of the IAM role that allows AWS Batch to make calls to other AWS services on your behalf.                    |
| `max_vcpus` | `string` | true| The maximum number of EC2 vCPUs that an environment can reach.                         |
| `subnets` | `string` | true| A list of VPC subnets into which the compute resources are launched.                     |
| `type` | `string` | true| The type of compute environment. Valid items are EC2, SPOT, FARGATE or FARGATE_SPOT.        |
| `security_group_ids` | `string` | true| TA list of EC2 security group that are associated with instances launched in the compute environment.                                                                       |



# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                        | aws|
| `role`                        | resources|
| `name`                        | mytestami|
| `service_role`                        | arn:aws:iam::046692759124:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch|
| `type`                        | MANAGED                      |
| `compute_environment_name`                        | test-compute-env                   |
| `state`                        | ENABLED                      |
| `servicompute_resourcesce_role`                        | {
       "allocation_strategy":"BEST_FIT",
       "bid_percentage":null,
       "desired_vcpus":null,
       "image_id":null,
       "ec2_key_pair":null,
       "instance_role":"arn:aws:iam::046692759124:instance-profile/ecsInstanceRole",
       "instance_type":["c4.large"],
       "max_vcpus":16,
       "min_vcpus":null,
       "security_group_ids":["sg-8ab03be1"],
       "spot_iam_fleet_role":null,
       "subnets":["subnet-e6932a8e","subnet-3145b44b"],
       "tags":{},
       "type":"EC2",
       "ec2_configuration":{
          "image_id_override":null,
          "image_type":"ECS_AL2"
       },
       "launch_template":{
          "launch_template_id":null,
          "launch_template_name":null,
          "version":null
       }
 
    }                                                                                       |





# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `arn` | of the compute environment. |
|  `tags_all` |A map of tags assigned to the resource, including those inherited from the provide.                  |
|  `ecs_cluster_arn` |The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster used by the compute environment.   |
|  `status` |The current status of the compute environment (for example, CREATING or VALID).                               |
|  `status_reason` |A short, human-readable string to provide additional details about the current status of the compute environment".                                                                                                                |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment)