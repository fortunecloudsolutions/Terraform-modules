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
:hash: Provides a Lambda Layer Version resource. Lambda Layers allow you to reuse shared bits of code across multiple lambda functions.

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

| `layer_name` | `string` | true| Unique name for your Lambda Layer. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `layer_name`                   | testlayer                                                                                 |
| `s3_bucket`                        | test-buck-5                                        |
| `s3_key`                          | helloworldfile.zip                                                       |
| `s3_object_version`                          | null                                                    |
     


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `arn` | ARN of the Lambda Layer with version. |
|  `created_date` |Date this resource was created. |
|  `layer_arn` | ARN of the Lambda Layer without version. |
|  `signing_job_Arn` | ARN of a signing job. |
|  `signing_profile_version_arn` | ARN for a signing profile version. |
|  `source_code_size` | Size in bytes of the function .zip file. |
|  `version` | Lambda Layer version. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version#attributes-reference)