variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
  type        = string
}

variable "region" {
  description = "aws region"
  type        = string
}

variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}

variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}

variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}

variable "listener_arn" {
  description = "The ARN of the load balancer."
  type        = string
}

variable "listener_priority" {
  description = "The list of  priority for the each additional listener rule, it must be  between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule. A listener can't have multiple rules with the same priority."
  type        = list(number)
}

variable "number_of_listener_rules" {
  description = "The Number of listener rules added for the load balancer"
  type        = number
}

variable "routing_action_type" {
  description = "The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc"
  type        = list(string)

}
variable "single_fwd_target_grp_arn" {
  description = "The ARN of the Target Group to which to route traffic. Specify only if type is forward and you want to route to a single target group. To route to one or more target groups, use a forward block instead."
  type        = list(string)
}

variable "forward" {
  description = "One or more target groups block. should be a key value pairs for target_arn and weight (Percentage of the time traffic needs to be routed to a given target arn, Range 0-999) "
  type = list(object({
    target_group = list(object({ #One or more target groups block.
      arn    = string            #The Amazon Resource Name (ARN) of the target group.
      weight = number            #The weight. The range is 0 to 999.
    }))
    stickiness = object({ #Target Group Stickiness Config Blocks (for stickiness) supports the following:
      enabled  = bool     #Indicates whether target group stickiness is enabled.
      duration = number   #The time period, in seconds, during which requests from a client should be routed to the same target group. The range is 1-604800 seconds (7 days).
    })
  }))
}

variable "redirect" {
  description = "The listener configuration to redirect traffic"
  type = list(object({
    host        = string #The hostname. This component is not percent-encoded. The hostname can contain #{host}. Defaults to #{host}
    path        = string #The absolute path, starting with the leading "/". This component is not percent-encoded. The path can contain #{host}, #{path}, and #{port}. Defaults to /#{path}.
    port        = number #The port. Specify a value from 1 to 65535 or #{port}. Defaults to #{port}.
    protocol    = string #The protocol. Valid values are HTTP, HTTPS, or #{protocol}. Defaults to #{protocol}.
    query       = string # The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include the leading "?". Defaults to #{query}
    status_code = string #The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302).
  }))
}

variable "fixed_response" {
  description = "The listener configuration to give a fixed_response"
  type = list(object({
    content_type = string #The content type. Valid values are text/plain, text/css, text/html, application/javascript and application/json
    message_body = string #The message body.
    status_code  = string #The HTTP response code. Valid values are 2XX, 4XX, or 5XX.
  }))
}

variable "authenticate_cognito" {
  description = "The listener configuration to authenticate using Amazon Cognito"
  type = list(object({
    authentication_request_extra_params = number #The query parameters to include in the redirect request to the authorization endpoint. Max: 10.
    on_unauthenticated_request          = string #The behavior if the user is not authenticated. Valid values: deny, allow and authenticate
    scope                               = string #The set of user claims to be requested from the IdP.
    session_cookie_name                 = string #The name of the cookie used to maintain session information.
    session_timeout                     = number #The maximum duration of the authentication session, in seconds.
    user_pool_arn                       = string #The ARN of the Cognito user pool.
    user_pool_client_id                 = string #The ID of the Cognito user pool client.
    user_pool_domain                    = string #The domain prefix or fully-qualified domain name of the Cognito user pool.
  }))
}

variable "authenticate_oidc" {
  description = "The listener configuration to authenticate using Amazon OIDC-compliant IdP"
  type = list(object({
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
  }))
}


variable "condition" {
  description = "The condtions to add for additional listener rules, this is optional. One or more condition blocks can be set per rule. Most condition types can only be specified once per rule except for http-header and query-string which can be specified multiple times."
  type = list(object({
    host_header = object({
      values = list(string)
    })
    http_header = list(object({
      http_header_name = string
      values           = list(string)
    }))
    http_request_method = object({
      values = list(string)
    })
    path_pattern = object({
      values = list(string)
    })
    query_string = list(object({
      key   = string
      value = string
    }))
    source_ip = object({
      values = list(string)
    })
  }))
}
