resource "aws_vpc_endpoint_connection_accepter" "example" {
  vpc_endpoint_service_id = var.vpc_endpoint_service_id
  vpc_endpoint_id         = var.vpc_endpoint_id

}