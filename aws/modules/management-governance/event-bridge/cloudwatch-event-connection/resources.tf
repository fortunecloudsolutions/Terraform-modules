resource "aws_cloudwatch_event_connection" "event_connection" {

  name               = var.name
  description        = var.description
  authorization_type = var.authorization_type


  dynamic "auth_parameters" {
    for_each = var.auth_parameters != null ? [var.auth_parameters] : []
    content {
      dynamic "api_key" {
        for_each = lookup(auth_parameters.value, "api_key") != null ? [lookup(auth_parameters.value, "api_key")] : []
        content {
          key    = lookup(api_key.value, "key")
          value    = lookup(api_key.value, "value")

        }
       }

      dynamic "basic" {
        for_each = lookup(auth_parameters.value, "basic") != null ? [lookup(auth_parameters.value, "basic")] : []
        content {
          username    = lookup(basic.value, "username")
          password    = lookup(basic.value, "password")

        }
       }

      dynamic "oauth" {
        for_each = lookup(auth_parameters.value, "oauth") != null ? [lookup(auth_parameters.value, "oauth")] : []
        content {
          authorization_endpoint    = lookup(oauth.value, "authorization_endpoint")
          http_method    = lookup(oauth.value, "http_method")
          dynamic "client_parameters" {
            for_each = lookup(oauth.value, "client_parameters") != null ? [lookup(oauth.value, "client_parameters")] : []
            content {
                client_id    = lookup(client_parameters.value, "client_id")
                client_secret    = lookup(client_parameters.value, "client_secret")

            }
          }

          dynamic "oauth_http_parameters" {
            for_each = lookup(oauth.value, "oauth_http_parameters") != null ? [lookup(oauth.value, "oauth_http_parameters")] : []
            content {
                dynamic "body" {
                    for_each = lookup(oauth_http_parameters.value, "body") != null ? lookup(oauth_http_parameters.value, "body") : []
                    content {
                        key    = lookup(body.value, "key")
                        value   = lookup(body.value, "value")
                        is_value_secret    = lookup(body.value, "is_value_secret",null)
                        

                     }
                 }

                dynamic "header" {
                    for_each = lookup(oauth_http_parameters.value, "header") != null ? lookup(oauth_http_parameters.value, "header") : []
                    content {
                        key    = lookup(header.value, "key")
                        value   = lookup(header.value, "value")
                        is_value_secret    = lookup(header.value, "is_value_secret",null)
                        

                     }
                 }
              
                 dynamic "query_string" {
                    for_each = lookup(oauth_http_parameters.value, "query_string") != null ? lookup(oauth_http_parameters.value, "query_string") : []
                    content {
                        key    = lookup(query_string.value, "key")
                        value   = lookup(query_string.value, "value")
                        is_value_secret    = lookup(query_string.value, "is_value_secret",null)
                        

                     }
                 }


            }
          }

        }
       }
      dynamic "invocation_http_parameters" {
            for_each = lookup(auth_parameters.value, "invocation_http_parameters") != null ? [lookup(auth_parameters.value, "invocation_http_parameters")] : []
            content {
                dynamic "body" {
                    for_each = lookup(invocation_http_parameters.value, "body") != null ? lookup(invocation_http_parameters.value, "body") : []
                    content {
                        key    = lookup(body.value, "key")
                        value   = lookup(body.value, "value")
                        is_value_secret    = lookup(body.value, "is_value_secret",null)
                        

                     }
                 }

                dynamic "header" {
                    for_each = lookup(invocation_http_parameters.value, "header") != null ? lookup(invocation_http_parameters.value, "header") : []
                    content {
                        key    = lookup(header.value, "key")
                        value   = lookup(header.value, "value")
                        is_value_secret    = lookup(header.value, "is_value_secret",null)
                        

                     }
                 }
              
                 dynamic "query_string" {
                    for_each = lookup(invocation_http_parameters.value, "query_string") != null ? lookup(invocation_http_parameters.value, "query_string") : []
                    content {
                        key    = lookup(query_string.value, "key")
                        value   = lookup(query_string.value, "value")
                        is_value_secret    = lookup(query_string.value, "is_value_secret",null)
                        

                     }
                 }


            }
 }
   }
  }
  
}
