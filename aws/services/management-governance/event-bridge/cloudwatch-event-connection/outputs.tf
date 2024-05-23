output "arn" {
  #{"type":"string","default":"arn:aws:events:us-east-2:046692759124:connection/test-eventt-connection/27e9260a-af4f-4a97-9a11-3c51cb79fddd"}
  description = "The Amazon Resource Name (ARN) of the connection."
  value       = module.event_connection.arn
}

output "secret_arn" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:046692759124:secret:events!connection/test-eventt-connection/1329c29a-48d5-4b32-a68e-98733ed141d9-AtO6Kk"}
  description = "The Amazon Resource Name (ARN) of the secret created from the authorization parameters specified for the connection."
  value       = module.event_connection.secret_arn
}
