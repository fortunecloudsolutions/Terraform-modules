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
  description = "(Required) The name of the classifier."
}

variable "csv_classifier" {
  type = object({
    allow_single_column    = string       #(Optional) Enables the processing of files that contain only one column.
    contains_header        = string       #(Optional) Indicates whether the CSV file contains a header. This can be one of "ABSENT", "PRESENT", or "UNKNOWN".
    delimiter              = string       #(Optional) The delimiter used in the Csv to separate columns.
    disable_value_trimming = bool         #(Optional) Specifies whether to trim column values.
    header                 = list(string) #(Optional) A list of strings representing column names.
    quote_symbol           = string       #(Optional) A custom symbol to denote what combines content into a single column value. It must be different from the column delimiter.
  })
  description = "(Optional) A classifier for Csv content. Defined below."
  default     = null
}

variable "grok_classifier" {
  type = object({
    classification  = string #(Required) An identifier of the data format that the classifier matches, such as Twitter, JSON, Omniture logs, Amazon CloudWatch Logs, and so on.
    custom_patterns = string # (Optional) Custom grok patterns used by this classifier.
    grok_pattern    = string # (Required) The grok pattern used by this classifier.
  })
  description = "(Optional) A classifier that uses grok patterns. Defined below."
  default     = null
}

variable "json_classifier" {
  type = object({
    json_path  = string #(Required) A JsonPath string defining the JSON data for the classifier to classify. AWS Glue supports a subset of JsonPath, as described in Writing JsonPath Custom Classifiers.
  })
  description = "(Optional) A classifier for JSON content. Defined below."
  default     = null
}

variable "xml_classifier" {
  type = object({
    classification = string # (Required) An identifier of the data format that the classifier matches.
    row_tag        = string # (Required) The XML tag designating the element that contains each record in an XML document being parsed. Note that this cannot identify a self-closing element (closed by />). 
  })
  description = "(Optional) A classifier for XML content. Defined below."
  default     = null
}