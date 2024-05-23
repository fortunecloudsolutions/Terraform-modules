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

variable "ec2_config" {
  type = object({
    security_group_arns = list(string) # (Required) List of Amazon Resource Names (ARNs) of the EC2 Security Groups that are associated with the EFS Mount Target.
    subnet_arn          = string       # (Required) Amazon Resource Name (ARN) of the EC2 Subnet that is associated with the EFS Mount Target.
  })
  description = "(Required) Configuration block containing EC2 configurations for connecting to the EFS File System."
}

variable "efs_file_system_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of EFS File System."

}

variable "subdirectory" {
  type        = string
  description = "(Optional) Subdirectory to perform actions as source or destination. Default /."
  default     = "/"
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the object."
  default     = {}
}

