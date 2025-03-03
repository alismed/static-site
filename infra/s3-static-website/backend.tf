terraform {
  backend "s3" {
    bucket         = "alismed-terraform"
    key            = "${var.bucket_name}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}
