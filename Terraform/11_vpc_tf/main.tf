# Create A vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Create A Private Subnets
resource "aws_subnet" "my_private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "my_private_subnet"
  }
}
# Create A Public Subnets
resource "aws_subnet" "my_public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "sa-east-1a"
  tags = {
    Name = "my_public_subnet"
  }

}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

# Create Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my_route_table"
  }
}

# Create Route Table Association
resource "aws_route_table_association" "public_subnet_association" {
       subnet_id = aws_subnet.my_public_subnet.id
       route_table_id = aws_route_table.my_route_table.id

}


# Create Ec2 instance with VPC
resource "aws_instance" "my_ec2_instance1" {
       ami = "ami-077aec33f15de0896"
       instance_type = "t3.micro"
       subnet_id = aws_subnet.my_public_subnet.id
        
       tags = {
              Name = "my_ec2_instance"
       }
}