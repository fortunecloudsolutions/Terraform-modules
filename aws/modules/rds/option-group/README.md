# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an RDS DB option group resource. Documentation of the available options for various RDS engines can be found at:

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name | The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS. |
|  option_group_description | The description of the option group |
|  engine_name | Specifies the name of the engine that this option group should be associated with. |
|  major_engine_version |  Specifies the major version of the engine that this option group should be associated with. |
|  options | A list of Options to apply |
|  timeouts | Define maximum timeout for deletion of aws_db_option_group resource |
|  identifier | The identifier of the resource |
|  tags | A mapping of tags to assign to the resource |


# Outputs
| Name | Description |
| ------------- | ------------- |
|  option_group_id |The db option group name. |
|  option_group_arn |The ARN of the db option group. |