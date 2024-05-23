# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Creates an entry (a rule) in a network ACL with the specified rule number.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  nacl_id | The ID of the network ACL. |
|  egress_enable | Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet). Default false. |
|  rule_no | The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number |
|  fport | The from port to match. |
|  tport |  The to port to match. |
|  protocol |  The protocol. A value of -1 means all protocols. |
|  cidr | The network range to allow or deny, in CIDR notation (for example 172.16.0.0/24 ). |
|  ipv6_cidr | The IPv6 CIDR block to allow or deny. |
|  action | Indicates whether to allow or deny the traffic that matches the rule. Accepted values: allow/ deny |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  nacl_id |The ID of the network ACL Rule |