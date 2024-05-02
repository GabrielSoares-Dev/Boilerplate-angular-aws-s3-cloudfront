output "distribution_id" {
    value = aws_cloudfront_distribution.boilerplate_angular_aws_s3_cloudfront_distribution.id
    description = "Distribution created into cloudfront"
}