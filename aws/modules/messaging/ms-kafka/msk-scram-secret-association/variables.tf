variable "cluster_arn" {
  type        = string
  description = "(Required, Forces new resource) Amazon Resource Name (ARN) of the MSK cluster."
}
variable "secret_arn_list" {
  type        = list(string)
  description = " (Required) List of AWS Secrets Manager secret ARNs."
}
