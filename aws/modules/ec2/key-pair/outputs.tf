output "key_name" {
  description = "The key pair name."
  value       = concat(aws_key_pair.this.*.key_name, [""])[0]
}