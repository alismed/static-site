/*
resource "aws_route53_record" "static_site" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.website_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.static_site.domain_name
    zone_id                = aws_cloudfront_distribution.static_site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_zone" "primary" {
  name = var.website_domain
}
*/
