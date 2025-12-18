# Create a VPC
resource "aws_vpc" "my_vpc" {
       cidr_block = "10.0.0.0/16"
       tags = {
              Name = "my_vpc"
       }
}

# Create an Private Subnet
resource "aws_subnet" "my_private_subnet" {
       vpc_id = aws_vpc.my_vpc.id
       cidr_block = "10.0.1.0/24"
       tags = {
              Name = "my_private_subnet"
       }
}

# Create an public Subnet
resource "aws_subnet" "my_public_subnet" {
       vpc_id = aws_vpc.my_vpc.id
       cidr_block = "10.0.2.0/24"
       tags = {
              Name = "my_public_subnet"
       }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
       vpc_id = aws_vpc.my_vpc.id
       tags = {
              Name = "my_igw"
       }
}

# Create a Routing Table
resource "aws_route_table" "my_route_table" {
       vpc_id = aws_vpc.my_vpc.id

       route {
              cidr_block = "0.0.0.0/0"
              gateway_id = aws_internet_gateway.my_igw.id
       }
}

# Associate the public subnet with the routing table
resource "aws_route_table_association" "public_subnet" {
       subnet_id = aws_subnet.my_public_subnet.id
       route_table_id = aws_route_table.my_route_table.id
}

