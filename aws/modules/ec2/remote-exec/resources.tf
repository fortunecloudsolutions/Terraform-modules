resource "null_resource" "remote-provisioner" {
  connection {
    host        = var.host
    type        = "ssh"
    user        = var.user_name
    private_key = var.private_key
  }

  provisioner "file" {
    content     = var.content
    destination = var.destination_file
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ${var.destination_file}",
      "sudo ${var.destination_file}"
    ]
  }
}