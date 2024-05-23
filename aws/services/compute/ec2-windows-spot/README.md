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


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
|:one: `ami` | `string` | true | AMI to use for the instance. |
|:two: `key_name` | `string` | true| Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource. |
|:three: `tags` | `map` | false | A map of tags to assign to the resource. |

# *Optional Parameters*
* `associate_public_ip_address` : 	 Whether to associate a public IP address with an instance in a VPC.
* `availability_zone` :	AZ to start the instance in.
* `security_groups` : A list of security group names to associate with.
* `instance_type`	: The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.

# *Example Input Values*
* Input

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `ami`                             | ami-0f25b344af3f73199                                                                    | 
| `instance_type`                   | t2.xlarge                                                                                 |
| `key_name`                        | Migration_Dev|
| `region`                          | us-east-2                                                                                |
| `lease_seconds`                   | 3600                                |
| `backend`                        | aws                          |
| `role`                        | resources                                             |
| `key_name`                        | Migration_Dev                                               |
| `pem_key`                        | "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA3B2DOiY7spQfnF0bYSwlhaWewHIkWmrfyjpQAHf57CCoKFEe\nRu4cKdVtTvf0Fa3vQHU6t+2/TtlxD6aRbbDQf2zvfAcdnV+R0G0KW8SRbboGJyDh\nura1+lVXv4trvQTxzlXKD1pR14EbUhOO2EGjhxSm1jhb4Dhy9S1VbUCKMiBfiOZu\ntnh+4qI3nKNGBMzM+QilSSYK4q5wUyMvbnyKz2Sf2UbrgK03YVyiA/KZAYgLPMBt\nOLF3Mi0IwY1JTap6EaJNuiTkLuUo9AUqIVvdIuiwh9BzLS1QLH2/ELaeqok1kPq7\nWQoDvQHQ8C2kQ5UFkPYfF9Ysl7RzT2p1vXPl6QIDAQABAoIBAAYHXOfD0lDC09bR\nigVwUxrE/YMh3TMIyFZeoIBSyOqZvmFUT3L75JOUv+iwy+OoHuxyCYiuH1ZGiF04\nX7VUaXGEB08rVrlPu8usoOMAkEckGDUMJoKZrIRNwBiD9hB4STMwkFc5TxKK+7eU\nx43Oxm7VtvgZFRMgGK30bumOIfrbcSBLbRt6ZtJRxuDlua0vyEk7i32I/0jH8KrE\nXw9H7D2/DzvS/LzSk/F6j4U0xlp7BvlRAHRuSWqXvdvFxXkXaU5ZlcY8zT5vtEkI\n+3T1xS8CAF3PSEKGXgH5pav3GPNAUUVfL+9f6+3ZcbHV2WZgBJOZZfjITr9AZvhP\nkn/rZ80CgYEA8+/ATZCCU+p/UZGyoTxhSvBvOQLtCbCZsqx5WCbVSOm4ykTd65Bg\n1fASp/QV7WvIQPHU7gCNGnR9k3QVYtDnuYkzPSTjhtd+3ofAk9/NlyELZ8c3Bbta\nZlgHm3ZFVThj6VcXZDgWoM+6lD6+jNaWlsyLtl3zmBFNgj2GMT3ixgMCgYEA5wAu\n6hx554zxz0UvUF2IiOCMMu4oWBT0cfZhs2PAbShfrc5IHg7qk+vecVL+P5YfbB2S\nG5wnhYwIGj0eupSYMfLXupwE02U9ryYPv3skJRgWIrM+SNG3dGf6ZYxbMW+u2Zry\nIP8HKsSULGUOOFavklV2Tr5otWPd/xZgzOn5RqMCgYEAs5W2BWR2DkF9KhgRYhKJ\nrhoER/yXdaLGBHxleThdnSg0GvVIS7wnDlmH4o4X9op7CxT+pZlSSD+qk3vKos0Z\nS8ZuKn2V5BeSF1HpvPPu72wscWKAZ3/etanpL9KKiIrTQ14Son2IayuDONBYiGcS\nxkIgOUpBo5pZbaDNwkLFSPECgYEApYSlGQzEcJy2W0z4hP4wKduzuX6am9qP+OSQ\nxwhPxidqv1ASrq8DeHBG2C6ejRNVepOJsIzoaLGY0KxAy3JTx155I3ZNoudlFo4Q\nNKTYlle27LBAjc7vQ9KJQaAba8XZpIR4wBncmdF3VoQmd0ntzc280tluj6J6XCA9\nxjZUbj8CgYANMo8kMTXZBbwJideFArnOQnf8g7cJq04FzdBn8UEQmnxARTWS3z5F\nrt5ak0ph2ML5gSWl6kb+oNHJ3t7J0opMHUhu1vCPyJjwxKxbQmbzcu2vi+akdG1F\nSZong3NsXWlQbCgXilSM2hUg2+O7oENPJ6mVlDHqcx0zBwKVRQf2AQ==\n-----END RSA PRIVATE KEY-----",|

| `user_data`                        | "PHBvd2Vyc2hlbGw+ClNldC1FeGVjdXRpb25Qb2xpY3kgQnlwYXNzIC1TY29wZSBQcm9jZXNzIC1Gb3JjZQpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtV2ViU2VydmVyUm9sZQpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtV2ViU2VydmVyCkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1Db21tb25IdHRwRmVhdHVyZXMKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUh0dHBFcnJvcnMKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUh0dHBSZWRpcmVjdApFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtQXBwbGljYXRpb25EZXZlbG9wbWVudApFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtb25saW5lIC1GZWF0dXJlTmFtZSBOZXRGeDRFeHRlbmRlZC1BU1BORVQ0NQpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtTmV0RnhFeHRlbnNpYmlsaXR5NDUKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUhlYWx0aEFuZERpYWdub3N0aWNzCkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1IdHRwTG9nZ2luZwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtTG9nZ2luZ0xpYnJhcmllcwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtUmVxdWVzdE1vbml0b3IKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUh0dHBUcmFjaW5nCkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1TZWN1cml0eQpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtUmVxdWVzdEZpbHRlcmluZwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtUGVyZm9ybWFuY2UKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLVdlYlNlcnZlck1hbmFnZW1lbnRUb29scwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtSUlTNk1hbmFnZW1lbnRDb21wYXRpYmlsaXR5CkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1NZXRhYmFzZQpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtTWFuYWdlbWVudENvbnNvbGUKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUJhc2ljQXV0aGVudGljYXRpb24KRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLVdpbmRvd3NBdXRoZW50aWNhdGlvbgpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtU3RhdGljQ29udGVudApFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtRGVmYXVsdERvY3VtZW50CkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1XZWJTb2NrZXRzCkVuYWJsZS1XaW5kb3dzT3B0aW9uYWxGZWF0dXJlIC1PbmxpbmUgLUZlYXR1cmVOYW1lIElJUy1BcHBsaWNhdGlvbkluaXQKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUlTQVBJRXh0ZW5zaW9ucwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtSVNBUElGaWx0ZXIKRW5hYmxlLVdpbmRvd3NPcHRpb25hbEZlYXR1cmUgLU9ubGluZSAtRmVhdHVyZU5hbWUgSUlTLUh0dHBDb21wcmVzc2lvblN0YXRpYwpFbmFibGUtV2luZG93c09wdGlvbmFsRmVhdHVyZSAtT25saW5lIC1GZWF0dXJlTmFtZSBJSVMtQVNQTkVUNDUKPC9wb3dlcnNoZWxsPg=="|

| `wait_for_fulfillment`                    | true                                                                        |


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  :one:`arn` | The ARN of the instance. |
|  :two:`id` |The ID of the instance. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)