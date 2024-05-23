# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a security group rule resource. Represents a single ingress or egress group rule, which can be added to external Security Groups.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  desc | Description of the rule. |
|  rule_type | The type of rule being created. Valid options are ingress (inbound) or egress (outbound). |
|  fport |  The start port (or ICMP type number if protocol is icmp or icmpv6). |
|  tport | The end port (or ICMP code if protocol is icmp). |
|  protocol |  The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number |
|  cidr |  List of CIDR blocks. |
|  ipv6_cidr | List of IPv6 CIDR blocks. |
|  prefix_ids | List of prefix list IDs |
|  security_groups | The security group to apply this rule to. |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  sg_rule_id |The ID of the security group rule |