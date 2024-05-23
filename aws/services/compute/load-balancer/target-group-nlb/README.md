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
:hash: Provides a Target Group resource for use with Load Balancer resources.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |



# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `port` | `string` | true | Configuration block for default actions.                |
| `protocol` | `string` | true| Protocol to use for routing traffic to the targets. Should be one of GENEVE, HTTP, HTTPS, TCP, TCP_UDP, TLS, or UDP.                      |
| `target_type` | `string` | true| ype of target that you must specify when registering targets with this target group. See doc for supported values. The default is instance.                             |
| `matcher` | `string` | true| Response codes to use when checking for a healthy responses from a target. You can specify multiple values (for example, "200,202" for HTTP(s) or "0,12" for GRPC) or a range of values (for example, "200-299" or "0-99").               |
| `path` | `string` | true| Destination for the health check request. Required for HTTP/HTTPS ALB and HTTP NLB. Only applies to HTTP/HTTPS.                |







# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `backend`                   | aws                                                                                 |
| `role`                   | resources                                                                                 |
| `target_group_name`                   | MySecondTerraformNLBTarget                   |
| `target_port`                   | 80                                                                                 |
| `target_protocol`                   | TCP                                                                                 |
| `target_vpc_id`                   | vpc-5a863f32                                                                            |
| `deregistration_delay`                   | 300                                            |
| `target_type`                   | instance                                                                                 |
| `health_check_enabled`                   | true                                    |
| `health_check_interval`                   | 10                                                                                 |
| `health_check_port`                   | 80                                                                                 |
| `health_check_protocol`                   | TCP                                                 |
| `healthy_unhealthy_threshold`                   | 2                                                                |
| `tags`                   | {                
    "Name": "MatildaMigrationDemo",
    "Team": "Devops"                         
  }                                                                                 |




# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` | ARN of the listener (matches arn|
| `arn` | ARN of the Target Group (matches id). |
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider. |
| `arn_suffix` |ARN suffix for use with CloudWatch Metrics. |
| `name` |Name of the Target Group. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group#attributes-reference)