/*
resource "aws_cloudfront_distribution" "static_site" {
  origin {
    domain_name = aws_s3_bucket.static_site_bucket.bucket_regional_domain_name
    origin_id   = "S3-${aws_s3_bucket.static_site_bucket.id}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.static_site.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static site distribution"
  default_root_object = var.index_document

  aliases = [var.website_domain]

  default_cache_behavior {
    target_origin_id       = "S3-${aws_s3_bucket.static_site_bucket.id}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    acm_certificate_arn      = var.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "static_site" {
  comment = "OAI for static site"
}
*/
