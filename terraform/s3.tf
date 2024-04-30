resource "aws_s3_bucket" "boilerplate_angular_aws_s3_cloudfront_bucket" {
  bucket = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"

  tags = {
    name        = "boilerplate-angular-aws-s3-cloudfront-bucket-${lower(var.environment)}"
    environment = lower(var.environment)

  }
}

resource "aws_s3_bucket_ownership_controls" "boilerplate_angular_aws_s3_cloudfront_bucket_ownership_controls" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

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


resource "aws_s3_bucket_website_configuration" "boilerplate_angular_aws_s3_cloudfront_bucket_website_config" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  index_document {
    suffix = "index.html"
  }
}
