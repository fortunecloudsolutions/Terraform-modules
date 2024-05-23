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
  description = "The name of the lifecycle hook."
}

variable "autoscaling_group_name" {
  type        = string
  description = "The name of the Auto Scaling group to which you want to assign the lifecycle hook"
}

variable "default_result" {
  type        = string
  description = "Defines the action the Auto Scaling group should take when the lifecycle hook timeout elapses or if an unexpected failure occurs. The value for this parameter can be either CONTINUE or ABANDON."
  default     = "ABANDON"
}

variable "heartbeat_timeout" {
  type        = number
  description = "Defines the amount of time, in seconds, that can elapse before the lifecycle hook times out. When the lifecycle hook times out, Auto Scaling performs the action defined in the DefaultResult parameter"
  default     = 3600
}

variable "lifecycle_transition" {
  type        = string
  description = "The instance state to which you want to attach the lifecycle hook. valid values autoscaling:EC2_INSTANCE_LAUNCHING & autoscaling:EC2_INSTANCE_TERMINATING"
}

variable "notification_metadata" {
  type        = string
  description = "Contains additional information that you want to include any time Auto Scaling sends a message to the notification target."
}

variable "notification_target_arn" {
  type        = string
  description = "The ARN of the notification target that Auto Scaling will use to notify you when an instance is in the transition state for the lifecycle hook. This ARN target can be either an SQS queue or an SNS topic."
}

variable "role_arn" {
  type        = string
  description = "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified notification target."
} 