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

variable "database_name" {
  type        = string
  description = "(Required) Name of the metadata database where the table metadata resides. For Hive compatibility, this must be all lowercase."
}

variable "table_name" {
  type        = string
  description = "(Required)The table name"
  default=null
}

variable "partition_values" {
  type        = list(string)
  description = "(Required) The values that define the partition."
}

variable "catalog_id" {
  type        = string
  description = "(Optional) ID of the Glue Catalog and database to create the table in. If omitted, this defaults to the AWS Account ID plus the database name."
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "(Optional) Properties associated with this table, as a list of key-value pairs."
  default     = {}
}

variable "storage_descriptor" {
  type = object({
    bucket_columns = list(string) #(Optional) List of reducer grouping columns, clustering columns, and bucketing columns in the table.

    columns = list(object({
      comment = string #(Optional) Free-form text comment.
      name    = string # (Required) Name of the Column.
      type    = string #(Optional) Datatype of data in the Column.
    }))

    compressed        = string      #(Optional) Whether the data in the table is compressed.
    input_format      = string      #(Optional) Input format: SequenceFileInputFormat (binary), or TextInputFormat, or a custom format.
    location          = string      #(Optional) Physical location of the table. By default this takes the form of the warehouse location, followed by the database location in the warehouse, followed by the table name.
    number_of_buckets = number      #(Optional) Must be specified if the table contains any dimension columns.
    output_format     = string      #(Optional) Output format: SequenceFileOutputFormat (binary), or IgnoreKeyTextOutputFormat, or a custom format.
    parameters        = map(string) #(Optional) User-supplied properties in key-value form.

    ser_de_info = object({
      name                  = string # (Optional) Name of the SerDe.
      parameters            = map(string)# (Optional) Map of initialization parameters for the SerDe, in key-value form.
      serialization_library = string #(Optional) Usually the class that implements the SerDe.
    })

    sort_columns = list(object({
      column     = string # (Required) Name of the column.
      sort_order = number # (Required) Whether the column is sorted in ascending (1) or descending order (0).
    }))

    skewed_info = object({
      skewed_column_names               = list(string) # (Optional) List of names of columns that contain skewed values.
      skewed_column_value_location_maps = map(string) # (Optional) List of values that appear so frequently as to be considered skewed.
      skewed_column_values              = list(string)  # (Optional) Map of skewed values to the columns that contain them.
    })

    stored_as_sub_directories = bool #(Optional) Whether the table data is stored in subdirectories.

  })
  description = "(Optional) Configuration block for information about the physical storage of this table."
  default     = null
}

