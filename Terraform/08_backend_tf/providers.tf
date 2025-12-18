terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }
  backend "s3" {
       bucket = "demo-bucket-9d5c508fafb45c7d"
       key = "bucket.tfstate"
       region = "sa-east-1"
    
  }

}
provider "aws" {
       region = "sa-east-1"
}