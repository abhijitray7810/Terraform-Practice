terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  project_name = "Count_tf"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project_name}_vpc"
  }
}
# Create Subnets
#resource "aws_subnet" "my_subnet_1" {
#       vpc_id = aws_vpc.my_vpc.id
#       cidr_block = "10.0.0.0/24"
#}
#resource "aws_Subnet" "my_subnet_2" {
#       vpc_id = aws_vpc.my_vpc.id
#       cidr_block = "10.0.1.0/24"
#}
#jode adala adala kore ai ta korta hoy tobe code anak boro hobe
# tar janno count used korla sata anak short a code likha hoya jabe

# Create Subnets using count

resource "aws_subnet" "my_subnets" {
  count  = 2
  vpc_id = aws_vpc.my_vpc.id
  #cidr_block = "10.0.1.0/24"
  cidr_block = "10.0.${count.index}.0/24"
  tags = {
    Name = "${local.project_name}_subnet_${count.index}"
  }


}

output "aws_subnet_id" {
  value = aws_subnet.my_subnets[0].id
  #value = aws_subnet.my_subnets[1].id # ekhn 2 ta subnet er id dekhabe
  #value = aws_subnet.my_subnets[*].id # ekhn sobgular id dekhabe
}