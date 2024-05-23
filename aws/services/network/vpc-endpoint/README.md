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
:hash: Provides a VPC Endpoint resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )




# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `vpc_id` | `string` | true | (Required) The VPC ID. |
| `service_name` | `string` | true | (Required) A list of virtual gateways for propagation. |




# *Example Input Values*
*Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `vpc_id`                             | vpc-5a863f32                                                                   | 

| `service_name`                        | com.amazonaws.us-east-2.s3|


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `id` |  The Flow Log ID. |
| `arn` |The ARN of the Flow Log. |
| `cidr_blocks ` |The ID of the AWS account that owns the route table. |
| `dns_entry ` |The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface.. |
| `network_interface_ids ` |One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface. |
| `owner_id ` |The ID of the AWS account that owns the VPC endpoint. |
| `prefix_list_id ` |The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway. |
| `requester_managed ` |Whether or not the VPC Endpoint is being managed by its service - true or false.|



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint#argument-reference)