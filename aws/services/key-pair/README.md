:warning: ***Matilda Disclaimer***
```javascript
"Matilda Software SCOPE OF LICENSE. This license applies to the Matilda cloud product. The software is licensed, not sold. This agreement only gives you some rights to use the software. 
Matilda reserves all other rights. Unless applicable law gives you more rights despite this limitation, you may use the software only as expressly permitted in this agreement. 
In doing so, you must comply with any technical limitations in the software that only allow you to use it in certain ways. 
You may not reverse engineer, decompile or disassemble the software, or otherwise attempt to derive the source code for the software except and solely to the extent required by 
third party licensing terms governing use of certain open source components that may be included in the software; remove, minimize, block or modify any notices of Matilda or its suppliers in the softwares. 
Use the software in any way that is against the law; share, publish, rent or lease the software, or provide the software as a offering for others to use."
```

# *Service Description*
:hash: Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )


# *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |

| `piblic_key` | `string` | true| The public key material. |

# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `region`                             | us-east-2                                                                    | 
| `key_name`                   | test_new                                                                                 |
| `algorithm`                        | RSA                        |
| `rsa_bits`                        | 4096                                     |
| `file_permission`                        | 0400                                    |
| `filepath`                        | HOME                                                     |

# *Verify the results in Output Section*
*Output

| Name | Description |
| ------------- | ------------- |
| `arn` | The key pair ARN. |
| `id` |The key pair name. |
| `key_name` |The key pair name. |
| `key_pair_id` |The key pair ID. |
| `key_type` |The type of key pair. |
| `fingerprint` |The MD5 public key fingerprint as specified in section 4 of RFC 4716. |
| `tags_all` |A map of tags assigned to the resource, including those inherited from the provider . |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair#argument-reference)