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

variable "zone_id" {
  type        = string
  description = "The ID of the hosted zone to contain this record."
}

variable "name" {
  type        = string
  description = "The name of the record."
}

variable "type" {
  type        = string
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT"

  validation {
    condition = (var.type == "A" || var.type == "AAAA" || var.type == "CAA" || var.type == "CNAME"
      || var.type == "MX" || var.type == "NAPTR" || var.type == "NS" || var.type == "PTR"
    || var.type == "SOA" || var.type == "SPF" || var.type == "SRV" || var.type == "TXT")
    error_message = "Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  }

}

variable "ttl" {
  type        = number
  description = "The TTL of the record."
  default     = 300
}

variable "records" {
  type        = list(string)
  description = "A string list of records. " #To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \ '\'  inside the Terraform configuration string (e.g. 'first255characters\'\'morecharacters').
}

variable "set_identifier" {
  type        = string
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
  default     = null
}

variable "policy_type" {
  type        = string
  description = "The routing policy type for the record"

  validation {
    condition = (var.policy_type == "simple" || var.policy_type == "failover" ||
      var.policy_type == "geolocation" || var.policy_type == "latency" ||
    var.policy_type == "weighted" || var.policy_type == "multivalue")
    error_message = "Valid values are simple, failover, geolocation, latency, weighted, and multivalue."
  }

}

variable "health_check_id" {
  type        = string
  description = "The health check the record should be associated with."
  default     = null
}

variable "alias" {
  type = object({
    name                   = string # DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone.
    zone_id                = string # Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.
    evaluate_target_health = bool   # Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set. 
  })
  description = "An alias block. Conflicts with ttl & records. Alias record documented above."
  default     = null
}

variable "failover_routing_policy" {
  type = object({
    typ = string # PRIMARY or SECONDARY. A PRIMARY record will be served if its healthcheck is passing, otherwise the SECONDARY will be served
  })
  description = "A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy."
  default     = null
}

variable "geolocation_routing_policy" {
  type = object({
    continent   = string # A two-letter continent code
    country     = string #  A two-character country code or * to indicate a default resource record set.
    subdivision = string # A subdivision code for a country.
  })
  description = " A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy."
  default     = null
}

variable "latency_routing_policy" {
  type = object({
    region = string # An AWS region from which to measure latency. See
  })
  description = "A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy"
  default     = null
}

variable "weighted_routing_policy" {
  type = object({
    weight = number # A numeric value indicating the relative weight of the record. 
  })
  description = "A block indicating a weighted routing policy. Conflicts with any other routing policy"
  default     = null
}

variable "multivalue_answer_routing_policy" {
  type        = bool
  description = "Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
  default     = null
}
