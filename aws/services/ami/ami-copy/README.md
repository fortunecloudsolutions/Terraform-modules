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
:hash: The AMI resource allows the creation and management of a completely-custom Amazon Machine Image (AMI)

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )




# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `name` | `string` | true | (Required) The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. |
| `device_name` | `string` | true | (Required) Path at which the device is exposed to created instances. |
| `volume_size` | `string` | true | (Required) unless snapshot_id is set) Size of created volumes in GiB. |



# *Example Input Values*
*Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `name`                             | sample                                                                    | 
| `virtualization_type`                   | hvm                                                                                 |
| `root_device_name`                        | /dev/xvda|
| `imds_support`                        | v2.0|
| `ebs_block_device`                        | ALL|
| `device_name`                        | /dev/xvda|
| `snapshot_id`                        | snap-02f9104e9355010c3|
| `volume_size`                        | 15|

# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `id` |  The Flow Log ID. |
| `arn` |The ARN of the Flow Log. |
| `root_snapshot_id ` |Snapshot ID for the root volume (for EBS-backed AMIs) |
| `owner_id ` |Operation of the Amazon EC2 instance and the billing code that is associated with the AMI. |
| `usage_operation ` |Snapshot ID for the root volume (for EBS-backed AMIs) |
| `platform_details ` |SPlatform details associated with the billing code of the AMI |
| `image_owner_alias ` |AWS account alias (for example, amazon, self) or the AWS account ID of the AMI owner. |
| `image_type ` |Type of image. |
| `hypervisor ` |Snapshot ID for the root volume (for EBS-backed AMIs) |
| `platform ` |This value is set to windows for Windows AMIs; otherwise, it is blank. |
| `public ` |hether the image has public launch permissions." |
| `tags_all ` | Map of tags assigned to the resource, including those inherited from the provider" |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ami#root_snapshot_id)