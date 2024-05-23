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

variable "repository_name" {
  type        = string
  description = "(Required) Name of the repository."
}

variable "catalog_data" {
  type = object({
    about_text        = string       # (Optional) A detailed description of the contents of the repository. It is publicly visible in the Amazon ECR Public Gallery. The text must be in markdown format.
    architectures     = list(string) #(Optional) The system architecture that the images in the repository are compatible with. On the Amazon ECR Public Gallery, the following supported architectures will appear as badges on the repository and are used as search filters: ARM, ARM 64, x86, x86-64
    description       = string       # (Optional) A short description of the contents of the repository. This text appears in both the image details and also when searching for repositories on the Amazon ECR Public Gallery.
    logo_image_blob   = string       #(Optional) The base64-encoded repository logo payload. (Only visible for verified accounts) Note that drift detection is disabled for this attribute.
    operating_systems = list(string) #(Optional) The operating systems that the images in the repository are compatible with. On the Amazon ECR Public Gallery, the following supported operating systems will appear as badges on the repository and are used as search filters: Linux, Windows
    usage_text        = string       #(Optional) Detailed information on how to use the contents of the repository. It is publicly visible in the Amazon ECR Public Gallery. The usage text provides context, support information, and additional usage details for users of the repository. The text must be in markdown format.
  })
  description = "(Optional) Catalog data configuration for the repository."
  default     = null
}



variable "timeouts" {
  description = "aws_repository provides the following Timeouts configuration options"
  type = object({
    delete = string #(Default 20 minutes) How long to wait for a repository to be deleted.
  })
}