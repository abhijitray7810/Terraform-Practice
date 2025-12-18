#ai code a create 2 subnet create 4ec2 instance 2 in each subnet
locals {
  project_name = "Count_tf"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = {
    Name     = "${local.project_name}_vpc"
  }
}

# Create Subnets using count
resource "aws_subnet" "my_subnets" {
  count         = 2
  vpc_id        = aws_vpc.my_vpc.id
  #cidr_block   = "10.0.1.0/24"
  cidr_block    = "10.0.${count.index}.0/24"
  tags          = {
    Name        = "${local.project_name}_subnet_${count.index}"
  }
}



# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-068c0051b15cdb816" # Amazon Linux 2 AMI (HVM), SSD Volume Type in us-east-1
  instance_type = "t2.micro"
  count         = 4
  subnet_id     = element(aws_subnet.my_subnets[*].id, count.index % length(aws_subnet.my_subnets))
  # 0%2 = 0
  # 1%2 = 1
  # 2%2 = 0
  # 3%2 = 1
  tags          = {
    Name        = "${local.project_name}_ec2{count.index}"
  }
}


output "aws_subnet_id" {
  value  = aws_subnet.my_subnets[1].id
  #value = aws_subnet.my_subnets[1].id # ekhn 2 ta subnet er id dekhabe
  #value = aws_subnet.my_subnets[*].id # ekhn sobgular id dekhabe
}