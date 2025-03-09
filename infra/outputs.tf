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
  value = aws_s3_bucket_website_configuration.static_site.website_endpoint
}
