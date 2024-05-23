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
:hash: Provides the ability to register instances and containers with an Application Load Balancer (ALB) or Network Load Balancer (NLB) target group. For attaching resources with Elastic Load Balancer (ELB), see the aws_elb_attachment resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_lb_target_group`             | Provides an aws lb target group resource                                      |
| `aws_instance`             | Provides an aws instance resource                                      |



# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `target_group_arn` | `string` | true | he ARN of the target group with which to register targets.                |
| `target_id` | `string` | true| The ID of the target. This is the Instance ID for an instance, or the container ID for an ECS container.                      |








# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                   | aws                                                                                 |
| `role`                   | resources                                                                                 |
| `target_group_arn`                   | arn:aws:elasticloadbalancing:us-east-2:046692759124:targetgroup/MyFirstTerraformNLBTarget/985891f6046456a7                   |
| `instance_ip_ecscontainer_lambda_arn`        | i-092b89fb6fce27690", "i-0e27ba7c7efc31585"     |
| `target_port`                   | 80                                                                                 |
| `number_of_targets`                   | 2                                                                                 |
| `az_ip_address`                   | all                                                                                 |
| `target_type`                   | instance                                                                                 |


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` |  A unique identifier for the attachment.




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment#argument-reference)