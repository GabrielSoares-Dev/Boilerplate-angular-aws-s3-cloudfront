resource "aws_s3_bucket" "boilerplate_angular_aws_s3_cloudfront_bucket" {
  bucket = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"

  tags = {
    name        = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"
    environment = lower(var.environment)

  }
}

resource "aws_s3_bucket_policy" "boilerplate_angular_aws_s3_cloudfront_bucket_policy" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.arn}/*"
      }
    ]
  })
}


