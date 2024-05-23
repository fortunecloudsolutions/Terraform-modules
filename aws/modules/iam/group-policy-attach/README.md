# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Attaches a Managed IAM Policy to an IAM group

# Inputs
| Name | Description |
| ------------- | ------------- |
|  policy_arn  |  The ARN of the policy you want to apply |
|  group | The group the policy should be applied to |