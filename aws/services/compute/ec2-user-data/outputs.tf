output "template" {
  #{"type":"string","default":"template"}
  value       = data.template_file.bootstrap.template
  description = "See Argument Reference above."
}

output "vars" {
  #{"type":"map","default":"{}"}
  value       = data.template_file.bootstrap.vars
  description = "See Argument Reference above."
}

output "rendered" {
  #{"type":"string","default":"rendered"}
  value       = base64encode(data.template_file.bootstrap.rendered)
  description = "The final rendered template."
}