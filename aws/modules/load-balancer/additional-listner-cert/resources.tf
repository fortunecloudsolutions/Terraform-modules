resource "aws_lb_listener_certificate" "additional_ssl_certs" {
  count           = var.number_of_certs_added
  listener_arn    = var.listener_arn[count.index]
  certificate_arn = var.certificate_arn[count.index]
}
