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
    allow_origins     = list(string) #(Optional) The origins that can access the function URL.
    allow_methods     = list(string) #(Optional) The HTTP methods that are allowed when calling the function URL.
    allow_headers     = list(string) #(Optional) The HTTP headers that origins can include in requests to the function URL.
    expose_headers    = list(string) #((Optional) The HTTP headers in your function response that you want to expose to origins that call the function URL.
    max_age           = number #(Optional) The maximum amount of time, in seconds, that web browsers can cache results of a preflight request.

  })

}






