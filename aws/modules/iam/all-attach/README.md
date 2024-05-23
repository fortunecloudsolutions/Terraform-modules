# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Attaches a Managed IAM Policy to user(s), role(s), and/or group(s)

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name | The name of the attachment. This cannot be an empty string. |
|  policy_arn | The ARN of the policy you want to apply |
|  user_list | The user(s) the policy should be applied to |
|  roles_list | The role(s) the policy should be applied to |
|  group_list | The group(s) the policy should be applied to |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  policy_id |The policy's ID |
|  attach_name |The name of the attachment |