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
:hash: Manages Password Policy for the AWS Account.

# *Prerequisites*
1. AWS Account (user - access-key, secret-key )

## *Required Parameters*
| Name | Type | Required | Description |
| --- | --- | --- | --- |
| `allow_users_to_change_password` | `string` | true |  (Optional) Whether to allow users to change their own password. |
| `max_password_age` | `string` | true | (Optional) The number of days that an user password is valid.|
| `require_symbols` | `string` | true |  (Optional) Whether to require symbols for user passwords. |
| `hard_expiry` | `string` | true | (Optional) Whether users are prevented from setting a new password after their password has expired (i.e., require administrator reset). |

# *Example Input Values*
# *Input*

| Input value                       | Example values                                                                           |
|-----------------------------------|------------------------------------------------------------------------------------------|
| `allow_users_to_change_password`                          | true                                        | 
| `require_symbols`                          | true                                        | 
| `require_numbers`                          |     true                                    | 
| `max_password_age`                          |     90                                    | 
| `hard_expiry`                          |     false                                    | 


# *Verify the results in Output Section*
# *Output*
| Name | Description |
| ------------- | ------------- |
|  `expire_passwords` | Indicates whether passwords in the account expire.  |


# *External Links*
* :cloud: [MatildaCloud](https://www.matildacloud.com/docs/ "Matildacloud")
* :link: [AWS](https://aws.amazon.com/console/)
* :link: [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy)