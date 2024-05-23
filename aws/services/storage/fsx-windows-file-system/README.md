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
:hash: Manages a FSx Windows File System. 
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
| `throughput_capacity` | `string` | true | Throughput (megabytes per second) of the file system in power of 2 increments. Minimum of 8 and maximum of 2048. |
| `subnet_ids` | `string` | true | A list of IDs for the subnets that the file system will be accessible from. |
| `dns_ips` | `string` | true | A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory.  |
| `domain_name` | `string` | true | The fully qualified domain name of the self-managed AD directory. For example, corp.example.com. |
| `password` | `string` | true |The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. |
| `username` | `string` | true | The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain. |




# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `backend`                   | aws                                                                                |
| `lease_ttl_seconds`                   | 7200                                                                                 |
| `role`                   | resources                                                                                |
| `file_system_id`                   | fs-8f8fe5f7                                                                     |
| `subnet_id`                   | subnet-3145b44b                                                                      |
| `security_groups`                   | sg-8ab03be1                                                              |


# *Verify the results in Output Section*
# *Output

| Name | Description |
| ------------- | ------------- |
| `arn` | Amazon Resource Name of the file system. |
| `remote_administration_endpoint ` |For MULTI_AZ_1 deployment types, use this endpoint when performing administrative tasks on the file system using Amazon FSx Remote PowerShell. |
| `id` |The ID that identifies the file system (e.g., fs-ccfc0d65). |
| `dns_name` |The DNS name for the filesystem per documented convention. |
| `owner_id` | The AWS account that created the file system. If the file system was createdby an IAM user, the parent account to which the user belongs is the owner. |
| `preferred_file_server_ip` |The IP address of the primary, or preferred, file server. |
| `network_interface_id` |The ID of the network interface that Amazon EFS created when it created the mount target.|
| `vpc_id` |Identifier of the Virtual Private Cloud for the file system. |
| `tags_All` | A map of tags assigned to the resource, including those inherited from the provider. |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_windows_file_system#domain_name)