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
:hash: Provides an AWS EBS Volume Attachment as a top level resource, to attach and detach volumes from AWS Instances.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `device_name` | `string` | true | The device name to expose to the instance (for example, /dev/sdh or xvdh).  |
| `instance_id` | `string` | true| ID of the Instance to attach to. |
| `volume_id` | `map` | false | ID of the Volume to be attached. |


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `role`                        | aws                                             |
| `volume_id`                        | vol-0850fdb0027da365a                                  |
| `device_name`                        | /dev/sdx                         |
| `instance_id`                        | i-023b72a7468603ef8                       |
| `force_detach`                        | false                              |
| `skip_destroy`                        | true                          |


# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `device_name` | The device name exposed to the instance. |
| `instance_id` |The ID of the instance. |
| `volume_id` |ID of the Volume. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment#attributes-reference)