terraform {
  backend "s3" {
    bucket  = "alismed-terraform"
    key     = "static-site/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
