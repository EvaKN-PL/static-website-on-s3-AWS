output "s3_website_url" {
    description = "URL static website"
    value = aws_cloudfront_distribution.cdn.domain_name
  
}