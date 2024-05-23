output "kms_key_arn" {
  #{"type":"string","default":"arn:aws:kms:us-east-2:111122223333:key/1234abcd"}
  description = "The Amazon Resource Name (ARN) of the key."
  value       = module.aws_kms.kms_key_id

}