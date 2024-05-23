
resource "aws_route_table_association" "rta_subnet_public" {
  count          = length(var.subnet_id)
  subnet_id      = element(var.subnet_id, count.index)
  route_table_id = var.rtb_id
}
