output "result" {
  #{"type":"string","default":"dummy"}
  description = "String result of the lambda function invocation."
  value       = jsondecode(data.aws_lambda_invocation.invoke.result)
}
