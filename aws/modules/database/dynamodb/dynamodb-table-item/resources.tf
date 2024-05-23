resource "aws_dynamodb_table_item" "table_item" {
  table_name = var.table_name
  hash_key   = var.hash_key
  range_key  = var.range_key
  item       = var.item

}
