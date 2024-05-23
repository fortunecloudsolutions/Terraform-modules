# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an ECS cluster.

# Inputs

| Name | Description |
| ------------- | ------------- |
|  tags | (optional) Additional tags to be applied to all resources |
|  name | The name of the cluster (up to 255 letters, numbers, hyphens, and underscores) |
|  capacity_providers | List of short names of one or more capacity providers to associate with the cluster. |
|  setting | Configuration block(s) with cluster settings. |

# Outputs


| Name | Description |
| ------------- | ------------- |
|  cluster_id |The ID of the created ECS cluster. |
|  cluster_name |The name of the created ECS cluster. |
|  cluster_arn |The ARN of the created ECS cluster. |