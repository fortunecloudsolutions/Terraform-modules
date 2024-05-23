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
:hash: Provides an IAM policy.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `region` | `string` | true | Region |
|:two: `username` | `string` |The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces.|
|:three: `path`| `string` |Path in which to create the group. |






| Name | Description |
| ------------- | ------------- |
|  region |aws region |
|  vault_addr |vault address |
|  vault_token |vault token |
|  lease_seconds |The default TTL for credentials issued by this backend. |
|  backend |The path the AWS secret backend is mounted at, with no leading or trailing /s. |
|  role |The name to identify this role within the backend. Must be unique within the backend. |
|  name |The name of the policy. If omitted, Terraform will assign a random, unique name. |
|  path | Path in which to create the policy. See IAM Identifiers for more information. |
|  desc |Description of the IAM policy. |
|  iam_policy |The policy document. This is a JSON formatted string.  |

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `name`                            | matdevops                                                                                |
| `path`                            | /                                                                                        |

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`group_id` | The group's ID |
|  :two:`group_arn` |The ARN assigned by AWS for this group |
|  :three:`group_name` | The group's name |
|  :four:`group_unique_id` |The unique ID assigned by AWs |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
