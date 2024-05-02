resource "aws_cloudfront_distribution" "boilerplate_angular_aws_s3_cloudfront_distribution" {
  origin {
    domain_name              = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.bucket_regional_domain_name
    origin_id                = local.boilerplate_angular_aws_s3_cloudfront_distribution_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.boilerplate_angular_aws_s3_cloudfront_distribution_origin_access_control.id

  }

  enabled             = true
  default_root_object = "index.html"
  wait_for_deployment = false
  aliases = [var.domain]
  default_cache_behavior {
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    default_ttl            = 86400
    min_ttl                = 1
    max_ttl                = 31536000
    target_origin_id       = local.boilerplate_angular_aws_s3_cloudfront_distribution_origin_id
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.certificate.arn
    ssl_support_method  = "sni-only"
  }

  tags = {
    "environment" = var.environment
  }
}

resource "aws_cloudfront_origin_access_control" "boilerplate_angular_aws_s3_cloudfront_distribution_origin_access_control" {
  name                              = "cloudfront_distribution_origin_access_control"
  description                       = "Access control to boilerplate"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}