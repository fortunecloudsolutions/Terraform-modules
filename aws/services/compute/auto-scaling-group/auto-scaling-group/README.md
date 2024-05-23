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
:hash: Provides an Auto Scaling Group resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |
| `aws_placement_group`     | Provides a placement group resource.                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `max_size` | `string` | true |  Maximum size of the Auto Scaling Group. |
| `min_size` | `string` | true|  Minimum size of the Auto Scaling Group. |
| `launch_template` | `string` | true | Nested argument containing launch template settings along with the overrides to specify multiple instance types and weights. Defined below. |
| `launch_template_specifications` | `string` | true | Nested argument defines the Launch Template. Defined below. |
| `memory_mib` | `string` | true | Block describing the minimum and maximum amount of memory (MiB). Default is no maximum. |
| `vcpu_count` | `string` | true | Block describing the minimum and maximum number of vCPUs. Default is no maximum. |
| `key` | `string` | true | key. |
| `strategy` | `string` | true | trategy to use for instance refresh. The only allowed value is Rolling. |


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
| `backend`                        | aws                                             |
| `role`                        | resources                                |
| `asg_name`                        | MyFirstTerraformASG                                    |
| `max_size`                        | 10                                              |
| `min_size`                        | 3                                   |
| `desired_capacity`                        | 5                                           |
| `subnet_ids`                        | subnet-3145b44b","subnet-3145b44b                        |
| `target_group_arns`                        | arn:aws:elasticloadbalancing:us-east-2:046692759124:targetgroup/MyTargetGroupforASG/2cb63f5dd12d9590"]                                      |
| `launch_template`                        | {
  	"id" : "lt-06cbb3cc094a8a924",
  	"version" : 2
  }                                  |


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `arn` | The ARN of the ASG. |
| `availability_zones` |Availability zones of the Auto Scaling Group.                        |
| `min_size` |Minimum size of the Auto Scaling Group.                        |
| `max_size` |Maximum size of the Auto Scaling Group.                        |
| `default_cooldone` |Time between a scaling activity and the succeeding scaling activity.                     |
| `default_instance_warmup` |The duration of the default instance warmup, in seconds.                       |
| `name` |Name of the Auto Scaling Group.                            |
| `health_check_type` |"EC2" or "ELB". Controls how health checking is done.                          |
| `asg_id` |The autoscaling group id.                    |
| `desired_capacity` |The number of Amazon EC2 instances that should be running in the group.                       |
| `launch_configuration` | The launch configuration of the Auto Scaling Group.                   |
| `vpc_zone_identifier` |The VPC zone identifier.         |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)