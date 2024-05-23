output "network_interface_id" {
  #{"type":"string","default":"dummy"}
  description = "Network interface ID."
  value       = module.aws_network_interface_sg_attachment.network_interface_id
}
