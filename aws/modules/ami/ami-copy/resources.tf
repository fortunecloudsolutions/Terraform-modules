resource "aws_ami_copy" "example" {
  name              = var.name
  description       = var.description
  source_ami_id     = var.source_ami_id
  source_ami_region = var.source_ami_region


}
