:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the software. 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Manages Route 53 Hosted Zone Domain Name System Security Extensions (DNSSEC).

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `zone_id` | `string` | true | (Required) The ID of the private hosted zone that you want to authorize associating a VPC with.
| `vpc_id` | `string` | true | (Required) A list of VPC subnet IDs. |
| `vpc_region` | `string` | true | (Required) A list of VPC subnet IDs. |

# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                   | 
| `hosted_zone_id `                   | Required) Identifier of the Route 53 Hosted Zone.                                                                |

# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `id` | The db subnet group. |
| `arn ` |The ARN of the db subnet group. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_hosted_zone_dnssec)