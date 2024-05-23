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
:hash: Provides an Elastic IP resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `instance_id` | `string` | true | EC2 instance ID. |
| `key_name` | `string` | true| Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource. |
| `tags` | `map` | false | A map of tags to assign to the resource. |

# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

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
| `allocation_id` |  ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC. |
| `association_id` |ID representing the association of the address with an instance in a VPC. |
| `carrier_ip` |The ID of the instance. |
| `customer_owned_ip ` |The ID of the instance. |
| `domain ` |Indicates if this EIP is for use in VPC (vpc) or EC2-Classic (standard). |
| `private_dns` |The Private DNS associated with the Elastic IP address (if in VPC). |
| `private_ip` |Contains the private IP address (if in VPC). |
| `public_dns` |Public DNS associated with the Elastic IP address.. |
| `public_ip ` |Contains the public IP address. |
| `tags_all ` |TA map of tags assigned to the resource, including those inherited from the provider. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)