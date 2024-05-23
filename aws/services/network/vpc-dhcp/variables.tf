variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}

variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}

variable "role" {
  description = "Role is usually resources"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = null

}

variable "domain_name" {
  description = "(Optional) the suffix domain name to use by default when resolving non Fully Qualified Domain Names. In other words, this is what ends up being the search value in the /etc/resolv.conf file."
  type        = string
  default     = null
}

variable "domain_name_servers" {
  description = "(Optional) List of name servers to configure in /etc/resolv.conf. If you want to use the default AWS nameservers you should set this to AmazonProvidedDNS"
  type        = list(string)
  default     = []
}

variable "ntp_servers" {
  description = "(Optional) List of NTP servers to configure."
  type        = list(string)
  default     = null
}

variable "netbios_name_servers" {
  description = "(Optional) List of NETBIOS name servers."
  type        = list(string)
  default     = null
}

variable "netbios_node_type" {
  description = "(Optional) The NetBIOS node type (1, 2, 4, or 8). AWS recommends to specify 2 since broadcast and multicast are not supported in their network. For more information about these node types, see RFC 2132."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}




