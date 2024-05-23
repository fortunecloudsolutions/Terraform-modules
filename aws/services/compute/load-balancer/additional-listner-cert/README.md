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
:hash: Provides a Load Balancer Listener Certificate resource.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_acm_certificate`    | Provides a acm certificate resource.                                 |
| `aws_lb`                 | Provides a lb  resource.                                 |
| `aws_lb_listener`        | Provides a lb listener resource.                                 |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `listener_arn` | `string` | true | The ARN of the listener to which to attach the certificate. |
| `certificate_arn` | `string` | true| The ARN of the certificate to attach to the listener. |




# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `ami`                             | ami-005e54dee72cc1d00                                                                    | 
| `instance_type`                   | t2.micro                                                                                 |
| `key_name`                        | ^#keyname/name^ - To reference from previous task, Just a string to keep usedefined value|

# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |

| `id` |The listener_arn and certificate_arn separated by a _. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate#argument-reference)