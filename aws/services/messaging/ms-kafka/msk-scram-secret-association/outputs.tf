output "arn_id" {
  #{"type":"string","default":"arn:aws:kafka:us-east-2:111222333444:cluster/SalesCluster/abcd1234-abcd-cafe-abab-9876543210ab-4"}
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = module.msk_secret_association.arn_id
}
