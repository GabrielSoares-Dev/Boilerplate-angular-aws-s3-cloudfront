resource "aws_acm_certificate" "certificate" {
  domain_name       = var.domain
  validation_method = "EMAIL"

  provider = aws.us-east-1
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn = aws_acm_certificate.certificate.arn
}