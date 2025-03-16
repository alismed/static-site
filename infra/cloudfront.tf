resource "aws_cloudfront_distribution" "static_site" {
  origin {
    domain_name              = aws_s3_bucket.static_site_bucket.bucket_regional_domain_name
    origin_id                = "S3-${aws_s3_bucket.static_site_bucket.id}"
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static site distribution"
  default_root_object = var.index_document

  default_cache_behavior {
    target_origin_id       = "S3-${aws_s3_bucket.static_site_bucket.id}"
    viewer_protocol_policy = "allow-all" # Permite HTTP

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

  custom_error_response {
    error_code         = 403
    response_code      = 404
    response_page_path = "/${var.error_document}"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 404
    response_page_path = "/${var.error_document}"
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    cloudfront_default_certificate = true # Usa certificado padrão do CloudFront
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_control" "default" {
  name        = "S3 Static Website"
  description = "CloudFront access to S3"

  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
