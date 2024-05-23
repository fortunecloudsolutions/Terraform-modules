# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a top level resource to manage IAM Group membership for IAM Users. For more information on managing IAM Groups or IAM Users, see IAM Groups or IAM Users

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name  |  The name to identify the Group Membership |
|  group | group associated with the policy |
|  user | A list of IAM User names to associate with the Group |


# Outputs


| Name | Description |
| ------------- | ------------- |
|  membership_name | The name to identify the Group Membership |
|  users | list of IAM User names |
|  groups | IAM Group name |