resource "aws_s3_bucket" "static_site_bucket" {
    count  = var.destroy_bucket ? 0 : 1
    bucket = "${var.bucket_name}"

    website {
        index_document = "index.html"
        error_document = "404.html"
    }

    tags = {
      Name = "Static Site Bucket"
      Environment = "Production"
    }
}

resource "aws_s3_bucket_public_access_block" "static_site_bucket" {
  count  = var.destroy_bucket ? 0 : 1
  bucket = aws_s3_bucket.static_site_bucket[0].id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "static_site_bucket" {
  count  = var.destroy_bucket ? 0 : 1
  depends_on = [ 
    aws_s3_bucket_public_access_block.static_site_bucket,
    aws_s3_bucket_ownership_controls.static_site_bucket
   ]

   bucket = aws_s3_bucket.static_site_bucket[0].id
   acl    = "public-read"
}

resource "aws_s3_bucket_ownership_controls" "static_site_bucket" {
  count  = var.destroy_bucket ? 0 : 1
  bucket = aws_s3_bucket.static_site_bucket[0].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "static_site_bucket_policy" {
  count  = var.destroy_bucket ? 0 : 1
  bucket = aws_s3_bucket.static_site_bucket[0].id

  policy = file("policy-s3-static-website.json")
}
