# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description

Provides an Elastic IP resource.

Provides an AWS EIP Association as a top level resource, to associate and disassociate Elastic IPs from AWS Instances and Network Interfaces.

# Below are the order and Dependencies in which Load Balancer needs to be created.


# AWS Elastic Internet Protocol

These types of resources are supported:

* [EIP](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)

# Inputs
| Name | Description |
| ------------- | ------------- |
|  vpc | Boolean if the EIP is in a VPC or not. |
|  instance | EC2 instance ID |
|  network_interface | Network interface ID to associate with |
|  associate_with_private_ip | A user specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address |
|  public_ipv4_pool | EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs |
|  instance_id | The ID of the instance. This is required for EC2-Classic. For EC2-VPC, you can specify either the instance ID or the network interface ID, but not both. The operation fails if you specify an instance ID unless exactly one network interface is attached. |
|  allocation_id |  The allocation ID. This is required for EC2-VPC |
|  allow_reassociation | Whether to allow an Elastic IP to be re-associated. Defaults to true in VPC |
|  network_interface_id |  The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID |
|  private_ip_address |  The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  eip_id |Contains the EIP allocation ID |
|  eip_assocation_id |Contains the EIP association ID |