resource "local_file" "key" {

  filename          = var.key_name
  sensitive_content = var.private_key_pem #tls_private_key.private_key.private_key_pem
  file_permission   = var.file_permission
  provisioner "local-exec" {
    command = "mv ${var.key_name} ${var.filepath}/${var.key_name}.pem \n chmod 400 ${var.filepath}/${var.key_name}.pem"
  }
}
#command = "mv ${var.key_name} ${var.filepath}/${var.key_name}.pem \n chmod 400 ${var.filepath}/${var.key_name}.pem"
