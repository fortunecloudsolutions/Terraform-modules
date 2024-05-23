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
:hash: Manages an AWS Elasticsearch Domain.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | Region |
| `domain_name` | `string` |TName of the domain.|
| `enabled` | `string` |Whether advanced security is enabled.|
| `desired_state` | `string` |The Auto-Tune desired state for the domain.|
| `maintenance_schdule` | `string` |Configuration block for Auto-Tune maintenance windows.|
| `start_at` | `string` |Date and time at which to start the Auto-Tune maintenance schedule in RFC3339 format.|
| `duration` | `string` |Configuration block for the duration of the Auto-Tune maintenance window.|
| `cron_expression_for_recurrence` | `string` |TA cron expression specifying the recurrence pattern for an Auto-Tune maintenance schedule.|
| `value` | `string` |An integer specifying the value of the duration of an Auto-Tune maintenance window.|
| `unit` | `string` |TThe unit of time specifying the duration of an Auto-Tune maintenance window.|
| `identity_pool_id` | `string` |TID of the Cognito Identity Pool to use.|
| `role_arn` | `string` |TARN of the IAM role that has the AmazonESCognitoAccess policy attached.|
| `user_pool_id` | `string` |TID of the Cognito User Pool to use.|
| `ebs_enabled` | `string` |TThe unit of time specifying the duration of an Auto-Tune maintenance window.|
| `throughput` | `string` |TThe unit of time specifying the duration of an Auto-Tune maintenance window.|
| `volume_size` | `string` |TThe unit of time specifying the duration of an Auto-Tune maintenance window.|
| `cloudwatch_log_group_arn` | `string` |TARN of the Cloudwatch log group to which log needs to be published.|
| `automated_snapshot_start_hour` | `string` |THour during which the service takes an automated daily snapshot of the indices in the domain.|
| `subnet_ids` | `string` |T List of VPC Subnet IDs for the Elasticsearch domain endpoints to be created in.|


# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `domain_name`                            | test-elasticsearch-domain                                                                              |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `domain_id` | Unique identifier for the domain |
|  `arn` |ARN of the domain. |
|  `domain_name` | Name of the Elasticsearch domain |
|  `kibana_endpoint` |Domain-specific endpoint for kibana without https scheme. |
|  `tags_all` |Map of tags assigned to the resource, including those inherited from the provider |
|  `vpc_options.0.availability_zones` |If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside. |
|  `vpc_options.0.vpc_id` |If the domain was created inside a VPC, the ID of the VPC. |
|  `endpoint` |Domain-specific endpoint used to submit index, search, and data upload requests. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain)
