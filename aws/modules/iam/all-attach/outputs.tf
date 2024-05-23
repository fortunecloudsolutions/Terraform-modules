output "policy_id" {
  description = "The policy's ID"
  value       = aws_iam_policy_attachment.policy-attach.id
}

output "attach_name" {
  description = "The name of the attachment"
  value       = aws_iam_policy_attachment.policy-attach.name
}

