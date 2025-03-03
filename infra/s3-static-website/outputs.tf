output "bucket_id" {
  value = aws_s3_bucket.static_site_bucket[0].id
}

output "bucket_arn" {
  value = aws_s3_bucket.static_site_bucket[0].arn
}
