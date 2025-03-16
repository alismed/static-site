output "bucket_id" {
  value = aws_s3_bucket.static_site_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.static_site_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.static_site_bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket.static_site_bucket.website_endpoint
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.static_site.domain_name
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.static_site.id
}

output "cloudfront_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.static_site.arn
}

output "website_url" {
  description = "The URL of the website"
  value       = "http://${aws_cloudfront_distribution.static_site.domain_name}"
}

/*
output "website_hosting" {
  value = aws_s3_bucket.static_site_bucket.website_endpoint
}

output "website_url_full" {
  value = "http://${aws_s3_bucket.static_site_bucket.website_endpoint}"
}
*/