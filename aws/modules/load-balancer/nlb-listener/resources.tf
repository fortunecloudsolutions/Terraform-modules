
resource "aws_lb_listener" "nlb_listnr" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type = var.routing_action_type
    target_group_arn = (var.routing_action_type == "forward"
      && var.single_fwd_target_grp_arn != null
    ? var.single_fwd_target_grp_arn : null)

    dynamic "forward" {
      for_each = (var.routing_action_type == "forward"
        && var.single_fwd_target_grp_arn == null
        && var.forward != null
      ? [var.forward] : [])
      content {

        dynamic "target_group" {
          for_each = lookup(forward.value, "target_group")
          content {
            arn    = lookup(target_group.value, "arn", null)
            weight = lookup(target_group.value, "weight", null)
          }
        }
        dynamic "stickiness" {
          for_each = [lookup(forward.value, "stickiness")]
          content {
            enabled  = lookup(stickiness.value, "enabled", false)
            duration = lookup(stickiness.value, "duration", 60)
          }
        }
      }
    }

    dynamic "redirect" {
      for_each = (var.routing_action_type == "redirect"
      && var.redirect != null ? [var.redirect] : [])
      content {
        host        = lookup(redirect.value, "host", "#{host}")
        path        = lookup(redirect.value, "path", "/#{path}")
        port        = lookup(redirect.value, "port", "#{port}")
        protocol    = lookup(redirect.value, "protocol", "{#protocol}")
        query       = lookup(redirect.value, "query", "{#query}")
        status_code = lookup(redirect.value, "status_code", "HTTP_301")
      }
    }

    dynamic "fixed_response" {
      for_each = (var.routing_action_type == "fixed-response"
      && var.fixed_response != null ? [var.fixed_response] : [])
      content {
        content_type = lookup(fixed_response.value, "content_type", "text/plain")
        message_body = lookup(fixed_response.value, "message_body", null)
        status_code  = lookup(fixed_response.value, "status_code", "503")
      }
    }

    dynamic "authenticate_cognito" {
      for_each = (var.routing_action_type == "authenticate-cognito"
        && var.listener_protocol == "TLS"
      && var.authenticate_cognito != null ? [var.authenticate_cognito] : [])
      content {
        user_pool_arn                       = lookup(authenticate_cognito.value, "user_pool_arn")
        user_pool_client_id                 = lookup(authenticate_cognito.value, "user_pool_client_id")
        user_pool_domain                    = lookup(authenticate_cognito.value, "user_pool_domain")
        authentication_request_extra_params = lookup(authenticate_cognito.value, "authentication_request_extra_params", null)
        on_unauthenticated_request          = lookup(authenticate_cognito.value, "on_unauthenticated_request", "authenticate")
        scope                               = lookup(authenticate_cognito.value, "scope", null)
        session_cookie_name                 = lookup(authenticate_cognito.value, "session_cookie_name", null)
        session_timeout                     = lookup(authenticate_cognito.value, "session_timeout", null)
      }
    }

    dynamic "authenticate_oidc" {
      for_each = (var.routing_action_type == "authenticate-oidc"
        && var.listener_protocol == "TLS"
      && var.authenticate_oidc != null ? [var.authenticate_oidc] : [])
      content {
        authentication_request_extra_params = lookup(authenticate_oidc.value, "authentication_request_extra_params", null)
        authorization_endpoint              = lookup(authenticate_oidc.value, "authorization_endpoint")
        client_id                           = lookup(authenticate_oidc.value, "client_id")
        client_secret                       = lookup(authenticate_oidc.value, "client_secret")
        issuer                              = lookup(authenticate_oidc.value, "issuer")
        on_unauthenticated_request          = lookup(authenticate_oidc.value, "on_unauthenticated_request", "authenticate")
        scope                               = lookup(authenticate_oidc.value, "scope", null)
        session_cookie_name                 = lookup(authenticate_oidc.value, "session_cookie_name", null)
        session_timeout                     = lookup(authenticate_oidc.value, "session_timeout", null)
        token_endpoint                      = lookup(authenticate_oidc.value, "token_endpoint", null)
        user_info_endpoint                  = lookup(authenticate_oidc.value, "user_info_endpoint", null)
      }
    }
  }

}
