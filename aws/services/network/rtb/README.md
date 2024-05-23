:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the software 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Provides a resource to create a VPC routing table.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource.                                             |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|`region` | `string` | true | The AWS region for API calls. |
|`vpc id` | `list` | true | The VPC ID. |
|`route` | `list` | true | A list of route objects. |


# *Optional Parameters*
* `tags` : 	A map of tags to assign to the resource.
* `propagating_vgws` : 	A list of virtual gateways for propagation.


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `vpc id`                          | ^#VPC/vpc_id^                                                                            | 
| `route`                           | [{     "instance_id": null,     "nat_gateway_id": null,     "cidr_block": "0.0.0.0/0",      "network_interface_id": null,     "gateway_id": "^#Internet Gateway/gateway_id^",     "local_gateway_id": null,     "transit_gateway_id": null,      "vpc_peering_connection_id": null,      "egress_only_gateway_id": null}]   | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `rtb id` | The ID of the routing table |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)



