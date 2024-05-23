# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a VPC resource.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  cidr_vpc | The CIDR block for the VPC. |
|  enable_dns_support | A boolean flag to enable/disable DNS support in the VPC. Defaults true. |
|  enable_dns_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false. |
|  instance_tenancy | A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. |
|  tags_vpc | A map of tags to assign to the resource vpc. |
|  tags_gateway | A map of tags to assign to the resource gateway. |
|  gateway_enable | gateway enable flag |

# Outputs
| Name | Description |
| ------------- | ------------- |
|  vpc_id |The ID of the VPC |
|  gateway_id |Gateway id if enabled |
|  nacl_id |The ID of the network ACL created by default on VPC creation |