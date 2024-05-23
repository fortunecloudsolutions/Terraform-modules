# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an IAM policy.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  name | The name of the policy. If omitted, Terraform will assign a random, unique name. |
|  path |  Path in which to create the policy. See IAM Identifiers for more information. |
|  desc | Description of the IAM policy. |
|  iam_policy | The policy document. This is a JSON formatted string.  |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  policy_id |The policy's ID |
|  policy_arn | The ARN assigned by AWS to this policy. |
|  policy_name | The name of the policy |
|  policy | The policy document |