# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an IAM instance profile.


# Inputs

| Name | Description |
| ------------- | ------------- |
|  name | The profile's name. If omitted, Terraform will assign a random, unique name. |
|  role |  The role name to include in the profile. |
|  path | Path in which to create the profile. |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  profile_id |
|  profile_arn |
|  profile_name |
