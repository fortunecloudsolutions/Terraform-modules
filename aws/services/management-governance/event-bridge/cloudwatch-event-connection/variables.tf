variable "region" {
  description = "aws region"
  type        = string
}

variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
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

variable "name" {
  type        = string
  description = "(Required) The 12-digit AWS account ID that you are permitting to put events to your default event bus. Specify * to permit any account to put events to your default event bus, optionally limited by condition."
}

variable "description" {
  type        = string
  description = "(Optional) Enter a description for the connection. Maximum of 512 characters."
  default     = null
}

variable "authorization_type" {
  type        = string
  description = "(Required) Choose the type of authorization to use for the connection. One of API_KEY,BASIC,OAUTH_CLIENT_CREDENTIALS."
}

variable "auth_parameters" {
  type = object({

    api_key = object({
      key   = string #(Required) Header Name.
      value = string #(Required) Header Value. Created and stored in AWS Secrets Manager.

    })
    basic = object({
      username = string #(Required) A username for the authorization.
      password = string #(Required) A password for the authorization. Created and stored in AWS Secrets Manager.

    })
    oauth = object({
      authorization_endpoint = string #(Required) The URL to the authorization endpoint.
      http_method            = string #(Required) A password for the authorization. Created and stored in AWS Secrets Manager.
      client_parameters = object({
        client_id     = string #(Required) The client ID for the credentials to use for authorization. Created and stored in AWS Secrets Manager.
        client_secret = string #(Required) The client secret for the credentials to use for authorization. Created and stored in AWS Secrets Manager.

      })
      oauth_http_parameters = object({
        body = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))
        header = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))
        query_string = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))

      })
    })
  
    invocation_http_parameters = object({
        body = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))
        header = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))
        query_string = list(object({
          key             = string #(Required) The key for the parameter.
          value           = string #(Required) The value associated with the key. Created and stored in AWS Secrets Manager if is secret.
          is_value_secret = bool   #(Optional) Specified whether the value is secret.

        }))

      })


  })


  description = "(Required) Parameters used for authorization. A maximum of 1 are allowed."

}

