variable "bucket" {
  type        = string
  description = "(Required) The name of an AWS Partition S3 Bucket or the Amazon Resource Name (ARN) of S3 on Outposts Bucket that you want to associate this access point with."
}

variable "name" {
  type        = string
  description = "(Required) The name you want to assign to this access point."
}

variable "account_id" {
  type        = string
  description = "(Optional) The AWS account ID for the owner of the bucket for which you want to create an access point. Defaults to automatically determined account ID of the Terraform AWS provider."
  default     = null
}

variable "policy" {
  type        = string
  description = "(Optional) A valid JSON document that specifies the policy that you want to apply to this access point."
  default     = null
}

variable "public_access_block_configuration" {
  description = "(Optional) Configuration block to manage the PublicAccessBlock configuration that you want to apply to this Amazon S3 bucket. You can enable the configuration options in any combination. Detailed below."

  type = object({
    block_public_acls       = bool #(Optional) Whether Amazon S3 should block public ACLs for buckets in this account. Defaults to true. Enabling this setting does not affect existing policies or ACLs.
    block_public_policy     = bool # (Optional) Whether Amazon S3 should block public bucket policies for buckets in this account. Defaults to true. Enabling this setting does not affect existing bucket policies.
    ignore_public_acls      = bool #(Optional) Whether Amazon S3 should ignore public ACLs for buckets in this account. Defaults to true. Enabling this setting does not affect the persistence of existing ACLs and doesn't prevent new public ACLs from being set.
    restrict_public_buckets = bool #(Optional) Whether Amazon S3 should restrict public bucket policies for buckets in this account. Defaults to true. Enabling this setting does not affect previously stored bucket policies, except that public and cross-account access within  public bucket policy, including non-public delegation to specific accounts, is blocked. 
  })

  default = null
}

variable "vpc_configuration" {
  description = "(Optional) Configuration block to restrict access to this access point to requests from the specified Virtual Private Cloud (VPC)."

  type = object({
    vpc_id = string #(Required) This access point will only allow connections from the specified VPC ID.
  })

  default = null
}