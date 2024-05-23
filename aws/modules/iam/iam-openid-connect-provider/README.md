# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an IAM user.

Manages an IAM User Login Profile with limited support for password creation during Terraform resource creation. Uses PGP to encrypt the password for safe transport to the user. PGP keys can be obtained from Keybase.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  username | The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. |
|  path | Path in which to create the user. |
|  password_length | The length of the generated password on resource creation. Only applies on resource creation. |
|  password_required |  Whether the user should be forced to reset the generated password on resource creation.  |
|  pgp_key | Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  arn |The ARN assigned by AWS for this user |
|  unique_id |The unique ID assigned by AWS |
|  username |The IAM user's name |
|  password |The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import |