
resource "aws_cloudfront_origin_access_control" "oac" {
  name = "oac-for-s3"
  description = "Origin Access Control for S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

# Cloudfront Distribution

resource "aws_cloudfront_distribution" "cdn" {
    enabled = true
    default_root_object = "index.html"


    origin {
      domain_name = aws_s3_bucket.static_site.bucket_regional_domain_name
      origin_id = "s3-origin"
      origin_access_control_id = aws_cloudfront_origin_access_control.oac.id

    }

    default_cache_behavior {
        allowed_methods = [ "GET", "HEAD" ]
        cached_methods = [ "GET", "HEAD" ]
        target_origin_id = "s3-origin"

        viewer_protocol_policy = "redirect-to-https"

        cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6" # Managed-CachingOptimized
        origin_request_policy_id = "88a5eaf4-2fd4-4709-b370-b4c650ea3fcf" # Managed-AllViewer

    }

    aliases = [var.domain_name]

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    
    viewer_certificate {
      acm_certificate_arn = aws_acm_certificate.cert.arn
      ssl_support_method = "sni-only"
      minimum_protocol_version = "TLSv1.2_2021"
    }
  
}

resource "aws_route53_record" "website_dns" {
    zone_id = var.hosted_zone_id
    name = var.domain_name
    type = "A"
  
  alias {
    name = aws_cloudfront_distribution.cdn.domain_name
    zone_id = aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = false
  }
}