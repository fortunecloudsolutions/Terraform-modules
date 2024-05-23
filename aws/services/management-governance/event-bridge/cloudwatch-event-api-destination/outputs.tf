output "arn" {
  #{"type":"string","default":"arn:aws:events:us-east-2:046692759124:api-destination/test-api-destination/ce0266e8-babb-4869-962f-27a779dbb90d"}
  description = "The Amazon Resource Name (ARN) of the event API Destination."
  value       = module.event_api_destination.arn
}
