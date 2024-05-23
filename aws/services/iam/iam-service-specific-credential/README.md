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
:hash: Provides an IAM Service Specific Credential.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_iam_user`           | Provides an IAM user.                                                |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `username` | `string` | true | (Required) The name of the IAM user to associate the SSH public key with.. |
| `servicename` | `string` | true|  (Required) The name of the AWS service that is to be associated with the credentials.  |



# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `username`                          | test_user                                                                      | 
| `servicename`                       | codecommit.amazonaws.com                                                                |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `id` | The role the policy should be applied to |
|  `service_password` | The generated password for the service-specific credential. |
|  `service_user_name ` |  The generated user name for the service-specific credential. |
|  `service_specific_credential_id ` | The unique identifier for the service-specific credential. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_specific_credential#attributes-reference)