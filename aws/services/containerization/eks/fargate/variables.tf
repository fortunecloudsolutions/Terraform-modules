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
variable "cluster_name" {
  description = "(Required) Name of the EKS Cluster."
  type        = string
}

variable "fargate_profile_name" {
  description = "(Required) Name of the EKS Fargate Profile."
  type        = string

}

variable "subnets" {
  description = "(Required) Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)."
  type        = list(string)
}
variable "pod_execution_role_arn" {
  description = "(Required) Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Fargate Profile."
  type        = string
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = {}
}
variable "timeouts" {
  description = "aws_eks_fargate_profile provides the following Timeouts configuration options"
  type = object({
    create = string # (Default 10 minutes) How long to wait for the EKS Fargate Profile to be created.
    delete = string #(Default 10 minutes) How long to wait for the EKS Fargate Profile to be deleted.
  })
}
variable "selector" {
  type = list(object({
    namespace = string      #  (Required) Kubernetes namespace for selection.
    labels    = map(string) #  (Optional) Key-value map of Kubernetes labels for selection.
  }))
  description = "(Required) Configuration block(s) for selecting Kubernetes Pods to execute with this EKS Fargate Profile. Detailed below."
  default     = []
}
