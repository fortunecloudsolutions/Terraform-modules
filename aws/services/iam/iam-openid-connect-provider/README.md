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
:hash: Provides an IAM OpenID Connect provider.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )


## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `url` | `string` | true | (Required) The URL of the identity provider. Corresponds to the iss claim. |
| `client_id_list` | `string` | true | (Required) A list of client IDs (also known as audiences).  |
| `thumbprint_list` | `string` | true |  (Required) A list of server certificate thumbprints for the OpenID Connect (OIDC) identity provider's server certificate(s).  |


# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `url`                          | https://accounts.google.com                                        | 
| `client_id_list`                          | ["openshift", "sts.amazonaws.com"]                                        | 
| `thumbprint_list`                          |        ["990F4193972F2BECF12DDEDA5237F9C952F20D9E", "90F4193972F2BECF12DDEDA5237F9C952F21234"]                                 | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |

|  `arn` | The ARN assigned by AWS for this provider. |
|  `tags_all ` |  A map of tags assigned to the resource, including those inherited from the provider. |




# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider)