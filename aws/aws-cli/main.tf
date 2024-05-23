provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}
resource "null_resource" "run-cli-input" {
  count = fileexists("${path.module}/mdata.json") ? 1 : 0
  provisioner "local-exec" {
    command = "AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${data.vault_aws_access_credentials.creds.access_key} AWS_SECRET_ACCESS_KEY=${data.vault_aws_access_credentials.creds.secret_key} aws  ${var.service} ${var.action} --region=${var.region} --output json --cli-input-json file://mdata.json > ${data.template_file.log_name.rendered}"
  }
}

resource "null_resource" "run-cli" {
  count = fileexists("${path.module}/mdata.json") ? 0 : 1
  provisioner "local-exec" {
    command = "AWS_DEFAULT_REGION=${var.region} AWS_ACCESS_KEY_ID=${data.vault_aws_access_credentials.creds.access_key} AWS_SECRET_ACCESS_KEY=${data.vault_aws_access_credentials.creds.secret_key} aws ${var.service} ${var.action} --region=${var.region} --output json  > ${data.template_file.log_name.rendered}"
  }
}

data "template_file" "log_name" {
  template = "${path.module}/output.log"
}


data "local_file" "run-cli-input" {
  filename   = data.template_file.log_name.rendered
  depends_on = [null_resource.run-cli-input]
}
data "local_file" "run-cli" {
  filename   = data.template_file.log_name.rendered
  depends_on = [null_resource.run-cli]
}