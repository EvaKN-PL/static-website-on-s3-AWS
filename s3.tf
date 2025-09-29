resource "aws_s3_bucket" "static_site" {
    bucket = var.bucket_name
  
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
    bucket = aws_s3_bucket.static_site.id

    rule {
        object_ownership = "BucketOwnerEnforced"
    }
  
}

# Block public access
resource "aws_s3_bucket_public_access_block" "public_block" {
    bucket = aws_s3_bucket.static_site.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
  
}

# Configuration static hosting

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.static_site.id

    index_document {
      suffix = "index.html"
    }
  
    error_document {
      key = "error.html"
    }
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_site.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.cdn.arn
          }
        }
      }
    ]
  })
}


