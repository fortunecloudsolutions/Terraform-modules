# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Load Balancer Listener Rule resource.

# Inputs
| Name | Description |
| ------------- | ------------- |
|  listener_arn | The ARN of the load balancer. |
|  listener_priority | The list of  priority for the each additional listener rule, it must be  between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule. A listener can't have multiple rules with the same priority. |
|  number_of_listener_rules | The Number of listener rules added for the load balancer |
|  routing_action_type  | The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc |
|  forward_target_group_block | One or more target groups block. should be a key value pairs for target_arn and weight (Percentage of the time traffic needs to be routed to a given target arn, Range 0-999)  |
|  foward_target_group_stickiness | The target group stickiness for the rule,  should be a key value pairs for  enablestickyn (Indicates whether target group stickiness is enabled.) and duration (The time period, in seconds, during which requests from a client should be routed to the same target group) |
|  redirect_info | The listener configuration to redirect traffic |
|  fixed_response_info | The listener configuration to give a fixed_response |
|  authenticate_cognito_info | The listener configuration to authenticate using Amazon Cognito |
|  authenticate_oidc_info | The listener configuration to authenticate using Amazon OIDC-compliant IdP |
|  condition_info | The condtions to add for additional listener rules, this is optional |

# Outputs

| Name | Description |
| ------------- | ------------- |
|  alb_listener_rules_arn |The ARN of the rule |