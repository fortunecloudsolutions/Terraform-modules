output "arn" {
  #{"type":"string","default":"arn:aws:events:us-east-2:046692759124:archive/test-event-archive"}
  description = "The Amazon Resource Name (ARN) of the event archive."
  value       = module.event_archive.arn
}
