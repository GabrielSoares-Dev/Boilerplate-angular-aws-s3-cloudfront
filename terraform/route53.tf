resource "aws_route53_zone" "primary" {
  name = "school-guardian.net.br"

  tags = {
    "managed-by"   = "terraform"
    "environment"  = var.environment
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.id
  name    = "www"
  type    = "A"



  alias {
    name                   = aws_cloudfront_distribution.boilerplate_angular_aws_s3_cloudfront_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.boilerplate_angular_aws_s3_cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }

}