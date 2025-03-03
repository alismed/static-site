terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "alismed-terraform/${var.bucket_name}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
