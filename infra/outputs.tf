output "bucket_id" {
  value = aws_s3_bucket.static_site_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.static_site_bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.static_site_bucket.bucket
}

output "website_domain" {
  value = aws_s3_bucket.static_site_bucket.website_domain
}

output "website_hosting" {
  value = aws_s3_bucket.static_site_bucket.website_endpoint
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_site.website_endpoint
}

output "website_url" {
  value = "http://${aws_s3_bucket.static_site_bucket.website_endpoint}"
}