# Admin Vault to set up Vault credentials

Set up the following environment variables

* TF_VAR_access_key 
* TF_VAR_secret_key
* TF_VAR_vault_addr
* TF_VAR_vault_token

# Description
Provides a Load Balancer Listener resource.

| Name | Description |
| ------------- | ------------- |
|  load_balancer_arn | The ARN of the load balancer. |
|  listener_port | The port on which the load balancer is listening. |
|  listener_protocol | The protocol for connections from clients to the load balancer. Valid values are TCP, TLS, UDP, TCP_UDP, HTTP and HTTPS. |
|  ssl_policy | The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS. |
|  certificate_arn | The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. For adding additional SSL certificates, see the aws_lb_listener_certificate resource. |
|  number_of_listener_rules  | The Number of listener rules added for the load balancer |
|  routing_action_type | The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc |
|  forward_target_group_block | One or more target groups block. should be a key value pairs for target_arn and weight (Percentage of the time traffic needs to be routed to a given target arn, Range 0-999)  |
|  foward_target_group_stickiness | The target group stickiness for the rule,  should be a key value pairs for  enablestickyness(Indicates whether target group stickiness is enabled.) and duration (The time period, in seconds, during which requests from a client should be routed to the same target group) |
|  redirect_info | The listener configuration to redirect traffic |
|  fixed_response_info | The listener configuration to give a fixed_response |
|  authenticate_cognito_info | The listener configuration to authenticate using Amazon Cognito |
|  authenticate_oidc_info | The listener configuration to authenticate using Amazon OIDC-compliant IdP |


# Outputs

| Name | Description |
| ------------- | ------------- |
|  nlb_listener |The ARN of the NLB listener |