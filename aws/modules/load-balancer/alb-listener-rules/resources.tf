
resource "aws_lb_listener_rule" "alb_listnr_rule" {
  count        = var.number_of_listener_rules
  listener_arn = var.listener_arn
  priority     = var.listener_priority[count.index]

  action {
    type = var.routing_action_type[count.index]
    target_group_arn = (var.routing_action_type[count.index] == "forward"
      && var.single_fwd_target_grp_arn[count.index] != null
    ? var.single_fwd_target_grp_arn[count.index] : null)

    dynamic "forward" {
      for_each = (var.routing_action_type[count.index] == "forward"
        && var.single_fwd_target_grp_arn[count.index] == null
        && var.forward[count.index] != null
      ? [var.forward[count.index]] : [])
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
      for_each = (var.routing_action_type[count.index] == "redirect"
      && var.redirect[count.index] != null ? [var.redirect[count.index]] : [])
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
      for_each = (var.routing_action_type[count.index] == "fixed-response"
      && var.fixed_response[count.index] != null ? [var.fixed_response[count.index]] : [])
      content {
        content_type = lookup(fixed_response.value, "content_type", "text/plain")
        message_body = lookup(fixed_response.value, "message_body", null)
        status_code  = lookup(fixed_response.value, "status_code", "503")
      }
    }

    dynamic "authenticate_cognito" {
      for_each = (var.routing_action_type[count.index] == "authenticate-cognito"
      && var.authenticate_cognito[count.index] != null ? [var.authenticate_cognito[count.index]] : [])
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
      for_each = (var.routing_action_type[count.index] == "authenticate-oidc"
      && var.authenticate_oidc[count.index] != null ? [var.authenticate_oidc[count.index]] : [])
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

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "path_pattern" {
        for_each = (lookup(condition.value, "path_pattern", null) != null
        ? [lookup(condition.value, "path_pattern")] : [])
        content {
          values = lookup(path_pattern.value, "values")
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "host_header" {
        for_each = (lookup(condition.value, "host_header", null) != null
        ? [lookup(condition.value, "host_header")] : [])
        content {
          values = lookup(host_header.value, "values")
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "http_request_method" {
        for_each = (lookup(condition.value, "http_request_method", null) != null
        ? [lookup(condition.value, "http_request_method")] : [])
        content {
          values = lookup(http_request_method.value, "values")
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "source_ip" {
        for_each = (lookup(condition.value, "source_ip", null) != null
        ? [lookup(condition.value, "source_ip")] : [])
        content {
          values = lookup(source_ip.value, "values")
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "query_string" {
        for_each = (lookup(condition.value, "query_string", null) != null
        ? lookup(condition.value, "query_string") : [])
        content {
          key   = lookup(query_string.value, "key", null)
          value = lookup(query_string.value, "value", null)
        }
      }
    }
  }

  dynamic "condition" {
    for_each = var.condition[count.index] != null ? [var.condition[count.index]] : []
    content {

      dynamic "http_header" {
        for_each = (lookup(condition.value, "http_header", null) != null
        ? lookup(condition.value, "http_header") : [])
        content {
          http_header_name = lookup(http_header.value, "http_header_name", null)
          values           = lookup(http_header.value, "values", null)
        }
      }
    }
  }

}
