
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

provider "aws" {
  region = "${var.region}"
}



resource "aws_instance" "my-ec2-instance" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "MyFirstEC2Instance"
  }
}
