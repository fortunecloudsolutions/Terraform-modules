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
:hash: Provides a VPC resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | The AWS region for API calls. |
|`cidr_vpc` | `string` | true| The CIDR block for the VPC. |
| `enable_dns_support` | `bool` | true | A boolean flag to enable/disable DNS support in the VPC. Defaults true. |
|`enable_dns_hostnames` | `bool` | true | A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false. |
| `instance_tenancy` | `string` | true | A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. |


# *Optional Parameters*
* `tags` : 	 A map of tags to assign to the resource vpc..


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `cidr_vpc`                        | 11.0.0.0/16                                                                              |
| `enable_dns_support`              | true                                                                                     |
| `enable_dns_hostnames`            | false                                                                                    | 
| `instance_tenancy`                | default                                                                                  |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `vpc_id` | The ID of the VPC. |
|  `gateway_id` | Gateway id if enabled. |
|  `nacl_id` | The ID of the network ACL created by default on VPC creation |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)