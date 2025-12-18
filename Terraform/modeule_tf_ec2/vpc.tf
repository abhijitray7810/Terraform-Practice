provider "aws" {
       region = "us-east-1"
  
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.5.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
 
  azs = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.0.0/24"]
  private_subnets = ["10.0.1.0/24"] 

  tags = {
       Name = "my_tf_vpc"
  }
}