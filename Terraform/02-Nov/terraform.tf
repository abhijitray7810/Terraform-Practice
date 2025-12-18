terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


backend "s3" {
  bucket = "my-remote-infra-bucket-abhijit-2025"
  key    = "terraform.tfstate"
  region = "ap-south-1"
  dynamodb_table = "basic-dynamodb-table"
}