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
:hash: Uploads an SSH public key and associates it with the specified IAM user.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

# *Dependencies*
| **Services Name**        | **Description**                                                      |
|--------------------------|----------------------------------------------------------------------|
| `aws_iam_user`           | Provides an IAM user.                                                |



## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `username` | `string` | true | (Required) The name of the IAM user to associate the SSH public key with.. |
| `encoding` | `string` | true|  (Required) Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH.  |
| `public_key` | `string` | true | (Required) The SSH public key. The public key must be encoded in ssh-rsa format or PEM format. |



# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `username`                          | us-east-2                                                                      | 
| `encoding`                       | SSH                                                                |
| `public_key`                      | ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAiN1+hkFmZeZOsnpKcNIrct1/PW89hNAJnvWUioUrOtyswxMgFs7ZHOQEdtjtCu0Y2GOOKzpWMY6+URQR71M09yOyKARUrsA7w/4CVhVWfG0QiIrUSmX6+msZQWn4acP9IJgF/RBKo49sERmQ7xrzlwyMxUXAfNavjKc2APB1shPP9NCijR+mEMYHlA0c2hbNgLwQnoRm57QYQgoato5lWjVVKh70rLzGNGaOIoGqpYzE991gafBZ1MhW1WXR9f+JHaxv4jL/hSQlmvgK7nce5sKbjZiWHzBKUIHdC6MCuxWZS74TVU4BMpJpdS6HN0NV/O7Rbpcj8oQADak+8K66mW6/7m6HfcY/DAgGj2UOv6OHtuNWlaKXMiF6oRaVywe2ml7OyHPu67RhD10LwUDvKEvmxmhOth31LEyMm+lpG7T1TmUHmpFkDJozgEUMO2T4Kmrc9clAtQ0Kt5NEeHfVEAyLC1Vc9at1f/CnpfHhR+GdhrNs/58AZdJVZ9eMXYNc0IHkxTOplrHVb3KCPaFIbOFxDWX2KdEezCtbNt0Ejpj2ibpk0xlZhZgR9tTdlD8ht3YFsGZ/Fouj+TCwVMNih8YpkV0o3P/QGxMv3b7vvWng0nf3r5nSA6HzUXcEBPpU8dni1+DshBCLeu1TdqDty7y4ApmKEZTKccJM08CoYXE= imported-openssh-key                                          |

# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `ssh_public_key_id` | The role the policy should be applied to |
|  `fingerprint` | The ARN of the policy you want to apply. |

# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_ssh_key)