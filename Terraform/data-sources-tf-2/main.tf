terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Ubuntu Data Source
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
# Create EC2 instance with Ubuntu
resource "aws_instance" "ubuntu_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "Ubuntu-Server"
  }
}

# Amazon Linux 2 Data Source
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
# Create EC2 instance with Amazon Linux 2
resource "aws_instance" "amazon_linux_server" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"

  tags = {
    Name = "Amazon-Linux-Server"
  }
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "amazon_linux_2_ami_id" {
  value = data.aws_ami.amazon_linux_2.id
}
