terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }

  backend "s3" {
    bucket = "e-commerce-site-441ce407d1938ff7"
    key    = "bucket.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"
}
