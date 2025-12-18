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

# Create Data Source for Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true
  #owners      = ["amazon"]
  owners       = ["099720109477"]


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20241124"]
    # values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] (number of * can be used as wildcard)
  }
}
# Create Data Source for Amazon Linux 2
data "aws_ami" "amazon_linux_2" {
  most_recent  = true
  #owners       = ["amazon"]
  owners       = ["137112412989"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.20240912.0-x86_64-gp2"]
    # values = ["amzn2-ami-hvm-*-x86_64-gp2"] (number of * can be used as wildcard)
  }
}
# Create Output Block
output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}
output "amazon_linux_2_ami_id" {
  value = data.aws_ami.amazon_linux_2.id
}

# Create an Ec2 instance
#resource "my_ec2_instance" "my_instance" {
#  ami           = ""
#  instance_type = ""
#  tags = {
#    Name = "my_ec2_123"
#  }
#}
