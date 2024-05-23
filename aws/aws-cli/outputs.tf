output "aws-cli-output" {
  value = data.local_file.run-cli-input.content
}
output "aws-cli" {
  value = data.local_file.run-cli.content
}