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
variable "host" {
  description = "host name to run remote execution"
  type        = string
}
variable "user_name" {
  description = "user name to run remote execution"
  type        = string
}
variable "pem_key" {
  description = "The decoded pem key as input"
  type        = string
}
variable "destination_file" {
  description = "remote file name to run on ec2 instance"
  type        = string
}
variable "mount_script" {
  description = "local script that has to be executed"
  type        = string
}
variable "device_name" {
  description = "device name to mount"
  type        = string
}
variable "volume_name" {
  description = "volume name to mount"
  type        = string
}