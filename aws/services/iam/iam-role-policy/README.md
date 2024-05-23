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
:hash: Provides an IAM role inline policy.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )





## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `policy` | `string` | true |  (Required) The inline policy document. This is a JSON formatted string.  |
| `role` | `string` | true | (Required) The name of the IAM role to attach to the policy. |





# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `iam_role`                          | resources                                       | 
| `iam_policy`                          | {\n\"Version\": \"2012-10-17\",\n\"Statement\": [{\n\"Action\": [\n\"ec2:Describe*\"\n],\n\"Effect\": \"Allow\",\n\"Resource\": \"*\"\n}\n]\n}                                        | 



# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `id` | The role policy ID, in the form of role_name:role_policy_name. |
|  `policy` | The policy document attached to the role. |
|  `role ` |  The name of the role associated with the policy. |
|  `name  ` | The name of the policy. |





# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)