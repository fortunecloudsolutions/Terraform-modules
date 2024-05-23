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
:hash: Provides an Elastic File System (EFS) File System resource.
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
| `availability_zone_name` | `string` | true | the AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes. |




# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `backend`                   | aws                                                                                |
| `lease_ttl_seconds`                   | 7200                                                                                 |
| `role`                   | resources                                                                                |
| `creation_token`                   | EFS Shared Data                                                                     |
| `tags`                   | {"Name": "MatriEFS"}                                                                      |
| `performance_mode`                   | generalPurpose                                                              |
| `throughput_mode`                   |     provisioned       |
| `transition_to_ia`                   | AFTER_90_DAYS                                                                 |
| `provisioned_throughput_in_mibps`                   | 1                                                      |
| `kms_key_id`                   | null                                                                                 |
| `encrypted`                   | true                                                                                 |


# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `arn` | Amazon Resource Name of the file system. |
| `availability_zone_id` |The identifier of the Availability Zone in which the file system's One Zone storage classes exist. |
| `id` |The ID that identifies the file system (e.g., fs-ccfc0d65). |
| `dns_name` |The DNS name for the filesystem per documented convention. |
| `owner_id` | The AWS account that created the file system. If the file system was createdby an IAM user, the parent account to which the user belongs is the owner. |
| `number_of_mount_targets` |The current number of mount targets that the file system has. |
| `size_in_bytes` |The latest known metered size (in bytes) of data stored in the file system, the value is not the exact size that the file system was at any point in time.|
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system#attributes-reference)