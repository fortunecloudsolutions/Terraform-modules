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

variable "principal" {
  type        = string
  description = "(Required) The 12-digit AWS account ID that you are permitting to put events to your default event bus. Specify * to permit any account to put events to your default event bus, optionally limited by condition."
}

variable "statement_id" {
  type        = string
  description = "(Required) An identifier string for the external account that you are granting permissions to."
}

variable "action" {
  type        = string
  description = "(Optional) The action that you are enabling the other account to perform. Defaults to events:PutEvents."
  default     = null
}

variable "event_bus_name" {
  type        = string
  description = "(Optional) The event bus to set the permissions on. If you omit this, the permissions are set on the default event bus."
  default     = null
}

variable "condition" {
  type = object({
    key    = string#(Required) Key for the condition. Valid values: aws:PrincipalOrgID.
    type   = string#(Required) Type of condition. Value values: StringEquals.
    value  =string #(Required) Value for the key.
  })

  description = "(Optional) Configuration block to limit the event bus permissions you are granting to only accounts that fulfill the condition. Specified below."
  default     = null
}