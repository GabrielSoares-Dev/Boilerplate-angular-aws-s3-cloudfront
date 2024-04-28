resource "aws_s3_bucket" "boilerplate_angular_aws_s3_cloudfront_bucket" {
  bucket = "boilerplate_angular_aws_s3_cloudfront_bucket_${lower(var.environment)}"

  tags = {
    name        = "boilerplate_angular_aws_s3_cloudfront_bucket_${lower(var.environment)}"
    environment = lower(var.environment)

  }
}

resource "aws_s3_bucket_acl" "boilerplate_angular_aws_s3_cloudfront_bucket_acl" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "boilerplate_angular_aws_s3_cloudfront_bucket_versioning" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.boilerplate_angular_aws_s3_cloudfront_bucket.id

  index_document {
    suffix = "index.html"
  }
}
