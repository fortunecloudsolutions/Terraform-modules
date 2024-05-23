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
:hash: Creates a Snapshot of an EBS Volume.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_vpc`                | Provides a VPC resource                                              |
| `aws_subnet`             | Provides an VPC subnet resource                                      |
| `aws_key_pair`           | Use this data source to get information about a specific EC2 Key Pair|
| `aws_security_group`     | Provides a security group resource.                                  |
| `aws_ebs_volume`     | Provides a ebs_volume resource.                                  |


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |

| `volume_id` | `map` | false | ID of the Volume to be attached. |

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `lease_seconds`                   | 3600                                                                                 |
| `role`                        | aws                                             |
| `volume_id`                        | vol-0850fdb0027da365a                                  |
| `description`                        | snap volume                      |



# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `arn` | Amazon Resource Name (ARN) of the EBS Snapshot. |
| `id` |The snapshot ID (e.g., snap-59fcb34e). |
| `owner_alias` |Value from an Amazon-maintained list (amazon, aws-marketplace, microsoft) of snapshot owners. |
| `owner_id` |The AWS account ID of the EBS snapshot owner.|
| `encrypted` |Whether the snapshot is encrypted. |
| `volume_size` |IThe size of the drive in GiBs. |
| `kms_key_id` |The ARN for the KMS encryption key. |
| `data_encryption_key_id` |The data encryption key identifier for the snapshot.|
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider. |



# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_snapshot#argument-reference)