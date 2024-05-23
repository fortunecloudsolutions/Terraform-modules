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
:hash: Provides a Route53 health check.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `hosted_zone_id` | `string` | true | (Required) Identifier of the Route 53 Hosted Zone.


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                   | 
| `region_name`                   | us-east-2                                                                 |
| `subnet_ids`                    | ["subnet-00f135c5e2f4107fa","subnet-0390641cc5d248a02"]                    |
| `vpc_id`                    | ["vpc-08229d6"]                    |
| `vpc_region`                    | ["ap-south-1"]                    |


# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `id` | The db subnet group. |
| `arn ` |The ARN of the db subnet group. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_global_table)