
# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a resource for adding an IAM User to IAM Groups. This resource can be used multiple times with the same user for non-overlapping groups.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  user | The name of the IAM User to add to groups |
|  groups | A list of IAM Groups to add the user to |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  user |The name of the IAM User |
|  group |The list of IAM Groups |