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
:hash: Provides an EC2 instance resource. This allows instances to be created, updated, and deleted.

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
| `ami` | `string` | true | AMI to use for the instance. |
| `key_name` | `string` | true| Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource. |
| `host` | `string` | true | A map of tags to assign to the resource. |
| `user_name` | `string` | true | A map of tags to assign to the resource. |
| `destination_file` | `string` | true | A map of tags to assign to the resource. |
| `mount_script` | `string` | true | A mount script to execute. |
| `key` | `string` | true | A Key to authenticate. |


# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                          | ami-005e54dee72cc1d00                                                                    | 
| `host`                            | "ec2-52-15-55-245.us-east-2.compute.amazonaws.com"                               |
| `user_name`                        | centos|
| `destination_file`                        | /tmp/umount.sh|
| `mount_script`                        | ../templates/remote-exec-linux-umount.sh"|
| `device_name`                        | /dev/xvdf|
| `volume_name`                        | /newvolume |
| `pem_key`                        | "-----BEGIN RSA PRIVATE KEY-----\nMIIEogIBAAKCAQEAjzTCuH5TclF1/p8sBqy/onlDitQlny1Zi6LB3cDvguW7E2JeE7ZFiNbOJCuP\nio09FuJsxzAuVQS1ZjEX6ecwAUyIIdctKyz6ZiPXRz8MPLlLs4Hif8AMRLTHOS5CEOZqW3jtOK+L\nN9kTA6f5+ZTa7t+BqRpcqylBqsdM3Z9OVdR+nPbH1nHlyNiOwOOfu1Z1euc8OM4rEGvj5NyFpxpZ\n+JGo2fnXJHgkvnGHPOdRDi2FFWfzq2cpz/RZgthqi/tbNSTBoYee5aidYl8SD1r4JGRtr5jqzQ0+\nLz6Fe2jeI4FP1QIh/6Ll+kPEECGsSnGPPsZghjwR0QYLFyBDIqf5mQIDAQABAoIBACeKKsVj48hp\no4mlCzPgmJzUnIiFYMndbJ74VkzTC455vbhxbYZFylco8AvelyhrLNXXuK8ap4BD544Kug6UDZYe\nOmwVjFwidBSlirgaOVe+1Z7/mrkpHnoN6//mvMkLxYvyDJWdKnRGFFDrHUMDDZvszFETfUipAH+V\nvaxnYuqhb5NG7T+4S7fBVPi3UbjXapvBfoeiSPTJhUuObRlI8OoVL4XQXFBqcV+hseNRbs68CLWa\nXH1JmCinGRRRztPh4L/W2ECiiAnNGbGoE4pBzqPIsYKTDAPec/QLlQ6p0nkQXTS2lUGODkPKoRMG\nidWN3C+4NoyBummw8QOMdAeQr4ECgYEA8ke0EMuPOiVLvMft9MRvGrYgWg7YoOTGiAbIBm3eNNow\ni3UtWS3OsK5SCgc/kvp/5QgEhrVoUKhN1Y5rlcro4Dchudg6Cj/T8c+I9L5yEtXj0XWQ3MizxDTQ\nF3+Ze2LbJ0rObVqrNlR/kBdiRKX0GWUkBIpe+H5JoCjrstC0fRECgYEAl1DMCbKRlarAH4O6mHip\nw46h+4r1F8IZMqeSz6uwJvGAfEupBbZknUYUr+oL0g0EV+tHEpdgHts8YmBxe8jbhbv2cBNInpa7\nvDbsR+x8SVJNqSdc6udpQOZkDtocwb2m7sKY3HCEpAjX3rkwLU+Urh7zmtwKudXdW30TKtbmVAkC\ngYAK722TLHzkdPZ8KNH2sD8Lh5jiN7VTXcAQN64jjCXxYL+8K6fGVKj1lIijZzxZV/EZ10jNA7cX\nnOEWeH0mn6fvJs3g43+LIuJgEavu0AG6E+ladOH69RwYCQIzbVDyHr4hgeDbUrJTm3C+gi+vRYZE\n9ymvAsfSk3CjR/WLdpwO4QKBgATyqGlcxHPvbG7bYNuhfnOdk2BlT9RiDW7hmeReidkMJpZp5vH/\n39RguUZzUcWhlVXGpMFP393Cb3wMCUnx7HO4DLvndYVyCluCNEG50uqW3WE9n0UzIfb0UatGqJAR\nQocmJ9d1enDetShcR94DbyouaurSbStceeuG8HyDIG75AoGAArVaZXdHPvst/WUDLjqc6ClpnIpq\n4p82eTR2EGVRbt2/uYt/zJjzgEgZGZ24abJ2N6iRILeCu6XQEqqV1/yQi5oul40MXEkLLhq0hUCK\n6LvW9qEF728KIzSASAVW4xJrAPlVGa2du3RjQ20S8Zyc5M6J6+mPnDxA2WflE2uCtH8=\n-----END RSA PRIVATE KEY-----",|


# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `arn` | The ARN of the instance. |
| `id` |The ID of the instance. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)