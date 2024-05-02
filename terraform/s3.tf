resource "aws_s3_bucket" "boilerplate_angular_aws_s3_cloudfront_bucket" {
  bucket = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"

  tags = {
    name        = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"
    environment = lower(var.environment)

  }
}

resource "aws_s3_bucket_public_access_block" "boilerplate_angular_aws_s3_cloudfront_bucket_public_access_block" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
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
  depends_on = [aws_s3_bucket_public_access_block.boilerplate_angular_aws_s3_cloudfront_bucket_public_access_block]
}

resource "aws_s3_bucket_ownership_controls" "boilerplate_angular_aws_s3_cloudfront_bucket_ownership_controls" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.boilerplate_angular_aws_s3_cloudfront_bucket_public_access_block]
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "boilerplate_angular_aws_s3_cloudfront_bucket_acl" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "boilerplate_angular_aws_s3_cloudfront_bucket_versioning" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}