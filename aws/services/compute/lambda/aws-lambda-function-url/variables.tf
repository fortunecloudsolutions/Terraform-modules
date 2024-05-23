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
variable "function_name" {
  type        = string
  description = "(Required) The name (or ARN) of the Lambda function."
}

variable "authorization_type" {
  type        = string
  description = "(Required) The type of authentication that the function URL uses. Set to AWS_IAM to restrict access to authenticated IAM users only."
}

variable "qualifier" {
  type        = string
  description = "(Optional) The alias name or LATEST."
   default = null
}

variable "cors" {
  type = object({
    allow_credentials = string # (Optional) Whether to allow cookies or other credentials in requests to the function URL. The default is false.
    allow_origins     = list(string)  #(Optional) The origins that can access the function URL.
    allow_methods     = list(string)  #(Optional) The HTTP methods that are allowed when calling the function URL.
    allow_headers     = list(string)  #(Optional) The HTTP headers that origins can include in requests to the function URL.
    expose_headers    = list(string) #((Optional) The HTTP headers in your function response that you want to expose to origins that call the function URL.
    max_age           = number #(Optional) The maximum amount of time, in seconds, that web browsers can cache results of a preflight request.

  })

}






