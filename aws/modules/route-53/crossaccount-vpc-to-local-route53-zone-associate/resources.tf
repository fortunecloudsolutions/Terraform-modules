resource "aws_route53_vpc_association_authorization" "vpc_associate_auth" {
  zone_id    = var.zone_id
  vpc_id     = var.vpc_id
  vpc_region = var.vpc_region
}

resource "aws_route53_zone_association" "zone_vpc_associate" {
  zone_id    = var.zone_id
  vpc_id     = var.vpc_id
  vpc_region = var.vpc_region
}