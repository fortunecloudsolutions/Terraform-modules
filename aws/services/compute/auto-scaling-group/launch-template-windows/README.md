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
:hash: Provides a resource to create a new launch configuration, used for autoscaling groups.

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
| `image_id` | `string` | true |  Maximum size of the Auto Scaling Group. |
| `instance_type` | `string` | true|  Name of the autoscaling group. |
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
| `template_name`                        | MyTestFirstLaunchTemplate                                    |
| `template_description`                        | launch Template test                                              |
| `image_id`                        | ami-0a54aef4ef3b5f881                                   |
| `instance_type`                        | t2.micro                                           |
| `key_name`                        | Matri                        |
| `user_data_filename`                        | launch-template-linux-tomcat.sh                        |
| `bucketname`                        | matri-ansible-template                        |
| `outputFile`                        | /home/ec2-user/                        |
| `awsFile`                        | launch-template-linux-tomcat.sh                        |
| `AWS_SERVICE`                        | s3                        |
                   
                   
                   
                   


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `id` | The ID of the launch configuration. |
| `arn` | The Amazon Resource Name of the launch configuration. |
| `name` | The name of the launch configuration. |





# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration)