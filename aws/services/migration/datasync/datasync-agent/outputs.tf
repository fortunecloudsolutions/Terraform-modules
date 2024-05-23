output "agent_arn" {
  #{"type":"string","default":"arn:aws:datasync:us-east-2:111222333444:agent/agent-0b0addbeef44baca3"}
  description = "Amazon Resource Name (ARN) of the DataSync Agent."
  value       = module.agent.agent_arn
}