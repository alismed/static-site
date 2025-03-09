terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile != "" ? var.profile : null
#  skip_credentials_validation = true
#  skip_metadata_api_check    = true
#  skip_requesting_account_id  = true

 # endpoints {
#    s3 = "http://localhost:4566"
#  }
}