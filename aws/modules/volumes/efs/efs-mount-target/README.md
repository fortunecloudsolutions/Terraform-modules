# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an Elastic File System (EFS) mount target.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  file_system_id | The ID of the file system for which the mount target is intended. |
|  subnet_id | The ID of the subnet to add the mount target in |
|  ip_address | The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target |
|  security_groups | A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target |

# Outputs
| Name | Description |
| ------------- | ------------- |
|  efs_id |The ID that identifies the file system (e.g. fs-ccfc0d65) |