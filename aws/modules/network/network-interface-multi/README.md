# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an Elastic network interface (ENI) resource.

| Name | Description |
| ------------- | ------------- |
|  subnet_id | Subnet ID to create the ENI in |
|  description | A description for the network interface |
|  private_ips | List of private IPs to assign to the ENI |
|  private_ips_count | Number of secondary private IPs to assign to the ENI. The total number of private IPs will be 1 + private_ips_count, as a primary private IP will be assiged to an 
ENI by default. |
|  security_groups |  List of security group IDs to assign to the ENI. |
|  attachment | Block to define the attachment of the ENI. Documented below. |
|  source_dest_check | Whether to enable source destination checking for the ENI. Default true. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  eni_id |The ID of the network interface |