# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an RDS DB subnet group resource.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name | The name of the DB subnet group. If omitted, Terraform will assign a random, unique name. |
|  subnet_ids | A list of VPC subnet IDs |
|  description | The description of the DB subnet group. |
|  tags | A map of tags to assign to the resource. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  subnet_group_id |The db subnet group name. |
|  subnet_group_arn |The ARN of the db subnet group. |