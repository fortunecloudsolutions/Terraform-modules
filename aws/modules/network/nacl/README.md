# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides an network ACL resource. You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC

# Inputs
| Name | Description |
| ------------- | ------------- |
|  vpc_id | The ID of the associated VPC. |
|  subnet_ids |  A list of Subnet IDs to apply the ACL to |
|  nacl_name  | name of the nacl |
|  ingress1_rule_no | The rule number. Used for ordering. |
|  ingress1_fport | The from port to match. |
|  ingress1_tport | The to port to match. |
|  ingress1_protocol | The protocol to match. |
|  ingress1_cidr | The CIDR block to match. This must be a valid network mask. |
|  ingress1_ipv6_cidr |  The IPv6 CIDR block. |
|  ingress1_action |  The action to take. |
|  ingress1_icmp_type | The ICMP type to be used. Default 0. |
|  ingress1_icmp_code | The ICMP type code to be used. Default 0. |
|  egress1_rule_no | The rule number. Used for ordering. |
|  egress1_fport | The from port to match. |
|  egress1_tport | The to port to match. |
|  egress1_protocol | The protocol to match. |
|  egress1_cidr | The CIDR block to match. This must be a valid network mask. |
|  egress1_ipv6_cidr |  The IPv6 CIDR block. |
|  egress1_action |  The action to take. |
|  egress1_icmp_type | The ICMP type to be used. Default 0. |
|  egress1_icmp_code | The ICMP type code to be used. Default 0. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  nacl_id |The ID of the network ACL |