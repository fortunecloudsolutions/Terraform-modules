# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an RDS DB parameter group resource .Documentation of the available parameters for various RDS engines can be found at:

# Inputs
| Name | Description |
| ------------- | ------------- |
|  name | The name of the DB parameter group. If omitted, Terraform will assign a random, unique name. |
|  family | The family of the DB parameter group. |
|  parameters |  A list of DB parameters to apply. Note that parameters may differ from a family to an other. |
|  description  | The description of the DB parameter group.  |
|  tags | A mapping of tags to assign to the resource |

# Outputs
| Name | Description |
| ------------- | ------------- |
|  dbparam_id |The db parameter group name. |
|  dbparam_arn | The ARN of the db parameter group.. |