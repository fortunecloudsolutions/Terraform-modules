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
:hash: Manages a Glue Security Configuration.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
|:three: `cloudwatch_encryption` | `string` |A cloudwatch_encryption block as described below, which contains encryption configuration for CloudWatch.|
|:four: `encryption_configuration` | `string` |Configuration block containing encryption configuration. Detailed below.|
|:five: `job_bookmark_encryption` | `string` |A job_bookmarks_encryption block as described below, which contains encryption configuration for job bookmarks.|
|:six: `s3_encryption` | `string` |A s3_encryption block as described below, which contains encryption configuration for S3 data.|




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-sec-configuration                                                                                |
| `encryption_configuration`           | {
      "s3_encryption":{
         "kms_key_arn" :  "arn:aws:kms:us-east-2:046692759124:key/062cf8ae-e994-49fb-a7e8-36bc21c2ccdb",
         "s3_encryption_mode":"SSE-KMS"
      },
      "cloudwatch_encryption":{
         "cloudwatch_encryption_mode" : "DISABLED",
         "kms_key_arn":null 
      },
      "job_bookmarks_encryption":{
         "job_bookmarks_encryption_mode" : "DISABLED",
         "kms_key_arn":null 
      }
   }                                                                                        |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | Glue security configuration name |
  


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_security_configuration)
