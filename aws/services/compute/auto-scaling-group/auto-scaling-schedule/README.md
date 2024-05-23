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
| `aws_autoscaling_group`     | Provides a autoscaloing group resource.                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `name` | `string` | true |  Maximum size of the Auto Scaling Group. |
| `autoscaling_group_name` | `string` | true|  Name of the autoscaling group. |
| `schedule_action_name` | `string` | true |  Name of this scaling action. |




# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                        | aws                                             |
| `role`                        | resources                                |
| `autoscaling_group_name`                        | MyFirstTerraformASG                                    |
| `scheduled_action_name`                        | MyFirstTerraformASGSchedule                                              |
| `start_time`                        | 2020-09-23T20:25:00Z                                   |
| `end_time`                        | 2020-09-23T23:00:00Z                                           |
| `recurrence`                        | 5 * * * *                        |
| `min_size`                        | 2                        |
| `max_size`                        | 3                        |
| `desired_capacity`                        | 2                        |
                   


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `arn` | ARN assigned by AWS to the scaling policy. |






# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy#attributes-reference)