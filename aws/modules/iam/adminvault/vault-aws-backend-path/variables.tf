variable "access_key" {
  description = "The AWS Access Key ID this backend should use to issue new credentials."
  type        = string
}
variable "secret_key" {
  description = "The AWS Secret Key this backend should use to issue new credentials. "
  type        = string
}
variable "region" {
  description = "The AWS region for API calls."
  type        = string
}
variable "path" {
  description = "The unique path this backend should be mounted at. Must not begin or end with a /."
  type        = string
  default     = "aws"
}
variable "default_lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}
variable "max_lease_seconds" {

  description = "The maximum TTL that can be requested for credentials issued by this backend."
  type        = string
}