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
:hash: Provides an IAM Server Certificate resource to upload Server Certificates.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_iam_user`           | Provides an IAM user.                                                |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `certificate_body` | `string` | true | (Required) The contents of the public key certificate in PEM-encoded format. |
| `private_key` | `string` | true | (Required) The contents of the private key in PEM-encoded format. |





# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `name`                          | Server-Certificate                                        | 
| `certificate_body`                          | true                                        | 
| `private_key`                          |                                         | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `id` | The Amazon Resource Name (ARN) of the role. |
|  `arn` | The Amazon Resource Name (ARN) specifying the role. |
|  `create_date ` |  The creation date of the IAM role. |
|  `name  ` | The name of the role. |
|  `path  ` | The path of the role. |
|  `unique_id  ` |  The stable and unique string identifying the role. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_server_certificate#argument-reference)