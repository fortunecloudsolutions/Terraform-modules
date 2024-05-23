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
:hash: Provides an IAM role.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |

| `user_name`| `string` |(Required) The user_name of the IAM user. |
| `group_list`| `string` |(Required) The group_list of the IAM groups |





# *Optional Parameters*
* `tags` : 	Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `user_name`                       | matriuser2                                                                          |
| `group_list`                      | "MatildaCost","EC2OnOregon"                                             |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `id` | The name of the role. |
|  `arn` |The Amazon Resource Name (ARN) specifying the policy. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/)
