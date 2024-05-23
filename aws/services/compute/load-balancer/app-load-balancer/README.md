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
:hash: Provides a Load Balancer resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_lb`                 | Provides a lb  resource.                                 |
| `aws_lb_listener`        | Provides a lb listener resource.                                 |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `bucket` | `string` | true | The S3 bucket name to store the logs in.              |
| `subnet_id` | `string` | true| ID of the subnet of which to attach to the load balancer. You can specify only one subnet per Availability Zone.                  |








# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `lease_seconds`                   | 3600                                                                                     |
| `backend`                         | aws                                                                                      |
| `role`                            | resources                                                                                |
| `alb_name`                        | MyFirstTerraformAppLB                                                                    |
| `alb_internal`                    | false                                                                                    |
| `security_group_ids`              | sg-05e7b643973901572","sg-8ab03be1"                                                      |
| `idle_timeout`                    | 90                                                                                       |
| `ip_address_type`                 | ipv4                                                                                     |
| `access_log_bucket_name`          | null                                                                                     |
| `enable_access_logs`              | false                                                                                    |
| `attach_alb_subnet_ids`           | subnet-3145b44b","subnet-34c4ea79","subnet-e6932a8e"                                     |
| `eip_alloc_ids`                   | [null, null, null]                                                                       |
| `private_ip4_for_internal_alb`    | [null, null, null]                                                                       |
| `authenticate_oidc`               | null                                                                                     |
| `tags`                            | {
                                        "Name": "MatildaMigration",
                                        "Team": "Devops"
                                      }                                                                               |






# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` | ARN of the listener (matches arn|
| `arn` | ARN of the listener (matches id |
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider. |
| `arn_suffix` |The ARN suffix for use with CloudWatch Metrics. |
| `dns_name` | The DNS name of the load balancer. |
| `subnet_mapping.*.outpost_id` |ID of the Outpost containing the load balancer. |
| `zone_id` |The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record). |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb#attributes-reference)