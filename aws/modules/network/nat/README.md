# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a resource to create a VPC NAT Gateway.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  subnet_id | The Subnet ID of the subnet in which to place the gateway. |
|  allocation_id | The Allocation ID of the Elastic IP address for the gateway. |
|  tags |  A map of tags to assign to the resource. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  nat_id |The ID of the NAT Gateway |
|  nat_allocation_id |The Allocation ID of the Elastic IP address for the gateway |
|  nat_network_interface_id |The ENI ID of the network interface created by the NAT gateway |
|  nat_private_ip |The private IP address of the NAT Gateway |
|  nat_public_ip |The public IP address of the NAT Gateway |