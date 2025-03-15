resource "aws_s3_bucket" "static_site_bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "static_site_bucket" {
  bucket = aws_s3_bucket.static_site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "static_site_bucket" {
  depends_on = [aws_s3_bucket_public_access_block.static_site_bucket]
  bucket = aws_s3_bucket.static_site_bucket.id

  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "static_site_bucket" {
  depends_on = [
    aws_s3_bucket_public_access_block.static_site_bucket,
    aws_s3_bucket_ownership_controls.static_site_bucket
  ]

  bucket = aws_s3_bucket.static_site_bucket.id
  acl    = var.acl_type
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  depends_on = [aws_s3_bucket_acl.static_site_bucket]
  bucket = aws_s3_bucket.static_site_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}

resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  depends_on = [aws_s3_bucket_public_access_block.static_site_bucket]
  bucket = aws_s3_bucket.static_site_bucket.id
  policy = templatefile("${path.module}/trust/policy-s3-static-site.json", {
    bucket_name = var.bucket_name
  })
}

# Upload files from app directory to S3 bucket
resource "aws_s3_object" "website_files" {
  for_each = fileset(var.app_path, "**/*")

  bucket       = aws_s3_bucket.static_site_bucket.id
  key          = each.value
  source       = "${var.app_path}/${each.value}"
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), null)
}
