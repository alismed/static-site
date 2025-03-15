variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "Define the aws profile"
  type        = string
  default     = ""
}

variable "bucket_name" {
  type = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
  default = {
    Name        = "Static Site Bucket"
    Environment = "Production"
  }
}

variable "index_document" {
  description = "Name of index document"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Name of error document"
  type        = string
  default     = "404.html"
}

variable "acl_type" {
  description = "ACL type for bucket"
  type        = string
  default     = "public-read"
}

variable "object_ownership" {
  description = "Object ownership setting"
  type        = string
  default     = "BucketOwnerPreferred"
}

variable "policy_file" {
  description = "Path to bucket policy file"
  type        = string
  default     = "trust/policy-s3-static-site.json"
}

variable "app_path" {
  description = "Path to the app files directory"
  type        = string
  default     = "app" # Default for GitHub Actions
}

variable "website_domain" {
  description = "The domain name for the static website"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for the website"
  type        = string
}

variable "use_localstack" {
  description = "Use LocalStack for local testing"
  type        = bool
  default     = false
}
