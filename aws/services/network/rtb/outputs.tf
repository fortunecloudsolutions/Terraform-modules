output "rtb_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the routing table"
  value       = module.rtb.rtb_id
}
