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
:hash: Provides a security group resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource.                                             |

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `region` | `string` | true | The AWS region for API calls. |
| `vpc_id` | `string` | true | The VPC ID. |
| `sg_name` | `string` | true | The name of the security group. If omitted, Terraform will assign a random, unique name |
| `sg_text` | `string` | true | The security group description. |
| `ingress1_desc` | `string` | true | Description of this ingress rule. |
| `ingress1_fport` | `number` | true | The start port (or ICMP type number if protocol is icmp or icmpv6) |
| `ingress1_tport` | `string` | true | The end range port (or ICMP code if protocol is icmp). |
| `ingress1_protocol` | `string` | true | The protocol. |
| `ingress1_cidr` | `list` | true | List of CIDR blocks. |
| `ingress1_ipv6_cidr` | `list` | true | List of IPv6 CIDR blocks. |
| `ingress1_security_groups` | `list` | true | List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC.|
| `egress1_desc` | `string` | true | Description of this egress rule. |
| `egress1_fport` | `string` | true | The start port (or ICMP type number if protocol is icmp or icmpv6) |
| `egress1_tport` | `string` | true | The end range port (or ICMP code if protocol is icmp). |
| `egress1_protocol` | `string` | true | The protocol. |
| `egress1_cidr` | `list` | true | List of CIDR blocks. |
| `egress1_ipv6_cidr` | `list` | true | List of IPv6 CIDR blocks. |
| `egress1_prefix_ids` | `list` | true | List of prefix list IDs. |
| `egress1_security_groups` | `list` | true | List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC. |

# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | us-east-2                                                                                | 
| `vpc_id`                          | ^#VPC/vpc_id^                                                                            |
| `sg_name`                         | ORACLE_SG_2                                                                              | 
| `sg_text`                         | ORACLE_SG_2                                                                              | 
| `ingress1_desc`                   | Allows Inbound Traffic                                                                   | 
| `ingress1_fport`                  | 0                                                                                        | 
| `ingress1_tport`                  | 1                                                                                        | 
| `ingress1_protocol`               |-1                                                                                        | 
| `ingress1_cidr`                   | ["0.0.0.0/0"]                                                                            | 
| `ingress1_ipv6_cidr`              | []                                                                                       | 
| `ingress1_security_groups`        | []                                                                                       | 
| `egress1_desc`                    | description                                                                              | 
| `egress1_fport`                   | 0                                                                                        | 
| `egress1_tport`                   | 1                                                                                        | 
| `egress1_protocol`                | -1                                                                                       | 
| `egress1_cidr`                    | []                                                                                       | 
| `egress1_ipv6_cidr`               | ["0.0.0.0/0"]                                                                            | 
| `egress1_prefix_ids`              | []                                                                                       | 
| `egress1_security_groups`         | []                                                                                       | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`sg_id` | The ID of the security group |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)