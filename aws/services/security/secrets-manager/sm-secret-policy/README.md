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
:hash: Provides a resource to manage AWS Secrets Manager secret metadata. 

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `instance_id` | `string` | true | EC2 instance ID. |
| `region` | `string` | true| (Required) Region for replicating the secret. |
| `automatically_after_days` | `map` | false | (Required) Specifies the number of days between automatic scheduled rotations of the secret. |

# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `ami`                             | ami-005e54dee72cc1d00                                                                    | 
| `instance_type`                   | t2.micro                                                                                 |
| `key_name`                        | ^#keyname/name^ - To reference from previous task, Just a string to keep usedefined value|

| `instance_id`                        | i-08be21fb21d2bc99f|

# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `id` |  ARN of the secret.. |
| `arn` |ARN of the secret. |
| `rotation_enabled` |Whether automatic rotation is enabled for this secret. |
| `replica` |Attributes of a replica are described below. |
| `last_accessed_date ` |Date that you last accessed the secret in the Region. |
| `status ` |Status can be InProgress, Failed, or InSync |
| `status_message` |Message such as Replication succeeded or Secret with this name already exists in this region.|



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret)