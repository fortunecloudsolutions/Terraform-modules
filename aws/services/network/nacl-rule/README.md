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
:hash: Provides an network ACL resource. You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `vpc_id` | `string` | true | (Required) The ID of the associated VPC. |


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `vpc_id`                             | vpc-5a863f32                                                                   | 


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `id` |  The ID of the network ACL |
| `arn` |The ARN of the network ACL.|
| `owner_id` |The ID of the AWS account that owns the network ACL.|
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider.|



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl)