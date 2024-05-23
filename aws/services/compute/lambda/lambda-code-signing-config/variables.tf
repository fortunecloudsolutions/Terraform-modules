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

variable "description" {
  type        = string
  description = "(Optional) Descriptive name for this code signing configuration."
  default     = null
}

variable "allowed_publishers" {
  type = object({
    signing_profile_version_arns = list(string) #(Required) The Amazon Resource Name (ARN) for each of the signing profiles. A signing profile defines a trusted user who can sign a code package.

  })
  description = "(Required) A configuration block of allowed publishers as signing profiles for this code signing configuration. Detailed below."
}

variable "policies" {
  type = object({
    untrusted_artifact_on_deployment = string #(Required) Code signing configuration policy for deployment validation failure. If you set the policy to Enforce, Lambda blocks the deployment request if code-signing validation checks fail. If you set the policy to Warn, Lambda allows the deployment and creates a CloudWatch log. Valid values: Warn, Enforce. Default value: Warn.

  })
  description = "(Optional) A configuration block of code signing policies that define the actions to take if the validation checks fail. Detailed below."
  default     = null
}
