resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = var.internet_gateway_id
  vpc_id              = var.vpc_id


}

