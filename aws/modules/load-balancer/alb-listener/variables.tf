
variable "load_balancer_arn" {

  description = "The ARN of the load balancer."
  type        = string
}

variable "listener_port" {
  description = "The port on which the load balancer is listening."
  type        = number
}

variable "listener_protocol" {
  description = "The protocol for connections from clients to the load balancer. Valid values are TCP, TLS, UDP, TCP_UDP, HTTP and HTTPS."
  type        = string
}

variable "ssl_policy" {
  description = "The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. For adding additional SSL certificates, see the aws_lb_listener_certificate resource."
  type        = string
}

variable "routing_action_type" {

  description = "The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc"
  type        = string
}

variable "single_fwd_target_grp_arn" {
  description = "The ARN of the Target Group to which to route traffic. Specify only if type is forward and you want to route to a single target group. To route to one or more target groups, use a forward block instead."
  type        = string
}

variable "forward" {
  description = "One or more target groups block. should be a key value pairs for target_arn and weight (Percentage of the time traffic needs to be routed to a given target arn, Range 0-999) "
  type = object({
    target_group = list(object({ #One or more target groups block.
      arn    = string            #The Amazon Resource Name (ARN) of the target group.
      weight = number            #The weight. The range is 0 to 999.
    }))
    stickiness = object({ #Target Group Stickiness Config Blocks (for stickiness) supports the following:
      enabled  = bool     #Indicates whether target group stickiness is enabled.
      duration = number   #The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds (7 days).
    })
  })
}

variable "redirect" {
  description = "The listener configuration to redirect traffic"
  type = object({
    host        = string #The hostname. This component is not percent-encoded. The hostname can contain #{host}. Defaults to #{host}
    path        = string #The absolute path, starting with the leading "/". This component is not percent-encoded. The path can contain #{host}, #{path}, and #{port}. Defaults to /#{path}.
    port        = number #The port. Specify a value from 1 to 65535 or #{port}. Defaults to #{port}.
    protocol    = string #The protocol. Valid values are HTTP, HTTPS, or #{protocol}. Defaults to #{protocol}.
    query       = string # The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading "?". Defaults to #{query}
    status_code = string #The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302).
  })
}

variable "fixed_response" {
  description = "The listener configuration to give a fixed_response"
  type = object({
    content_type = string #The content type. Valid values are text/plain, text/css, text/html, application/javascript and application/json
    message_body = string #The message body.
    status_code  = string #The HTTP response code. Valid values are 2XX, 4XX, or 5XX.
  })
}

variable "authenticate_cognito" {
  description = "The listener configuration to authenticate using Amazon Cognito"
  type = object({
    authentication_request_extra_params = number #The query parameters to include in the redirect request to the authorization endpoint. Max: 10.
    on_unauthenticated_request          = string #The behavior if the user is not authenticated. Valid values: deny, allow and authenticate
    scope                               = string #The set of user claims to be requested from the IdP.
    session_cookie_name                 = string #The name of the cookie used to maintain session information.
    session_timeout                     = number #The maximum duration of the authentication session, in seconds.
    user_pool_arn                       = string #The ARN of the Cognito user pool.
    user_pool_client_id                 = string #The ID of the Cognito user pool client.
    user_pool_domain                    = string #The domain prefix or fully-qualified domain name of the Cognito user pool.
  })
}



variable "authenticate_oidc" {
  description = "The listener configuration to authenticate using Amazon OIDC-compliant IdP"
  type = object({
    authentication_request_extra_params = number #The query parameters to include in the redirect request to the authorization endpoint. Max: 10.
    authorization_endpoint              = string #The authorization endpoint of the IdP.
    client_id                           = string #The OAuth 2.0 client identifier.
    client_secret                       = string #The OAuth 2.0 client secret.
    issuer                              = string #The OIDC issuer identifier of the IdP.
    on_unauthenticated_request          = string #The behavior if the user is not authenticated. Valid values: deny, allow and authenticate
    scope                               = string #The set of user claims to be requested from the IdP.
    session_cookie_name                 = string #The name of the cookie used to maintain session information.
    session_timeout                     = number #The maximum duration of the authentication session, in seconds.
    token_endpoint                      = string #The token endpoint of the IdP.
    user_info_endpoint                  = string #The user info endpoint of the IdP.
  })
}
