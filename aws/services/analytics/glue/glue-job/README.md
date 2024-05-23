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
:hash: Provides an aws_glue_job.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `name` | `string` |The name you assign to this job. It must be unique in your account.|
|:three: `command` | `string` |The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
|:four: `role_arn` | `string` |The ARN of the IAM role associated with this job.|
|:five: `script_location` | `string` |Specifies the S3 path to a script that executes a job.|



# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | test-job                                                                                |
| `connections`           | catalog-test-connection                                                                                      |
| `role`             | arn:aws:iam::046692759124:role/service-role/AWSGlueServiceRole-test-role-glue |
| `command`                            | {
      "name":"glueetl",
      "script_location":"s3://aws-glue-scripts-046692759124-us-east-2/sankireddy",
      "python_version":"3"
   }                                                |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`id` | The group's ID |
|  :two:`arn` |The ARN assigned by AWS for this group |
|  :three:`tags_all` | A map of tags assigned to the resource, including those inherited from the provider |
|  


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job)
