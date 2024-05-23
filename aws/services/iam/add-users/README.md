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
:hash: Provides an IAM user.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | Region |
| `username` | `string` |The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
| `path`| `string` |Path in which to create the user. |
| `password_length`| `number` |Whether the user should be forced to reset the generated password on resource creation. |
| `pgp_key`| `string` |Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username.|
| `password required`| `bool` |Password required.|


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `username`                        | matuserjoe                                                                               |
| `path`                            | /                                                                                        |
| `password_length`                 | 16                                                                                       |
| `password required`               | True                                                                                     |
| `pgp_key`                         | keybase:prad9192                                                                         |

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`arn` | The ARN assigned by AWS for this user. |
|  :two:`unique_id` |The unique ID assigned by AWS. |
|  :three:`username` | The unique ID assigned by AWS. |
|  :four:`password` |The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
