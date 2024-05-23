
variable "iam_policy" {
  description = "(Required) The policy document. This is a JSON formatted string. "
  type        = string

}

variable "name" {
  description = "(Optional) The name of the policy. If omitted, Terraform will assign a random, unique name"
  type        = string


}
variable "group" {
  description = "(Required) The IAM group to attach to the policy"
  type        = string
}
 