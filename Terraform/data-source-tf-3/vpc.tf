# Create a Vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}
# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "aws_private_subnet"
  }
}

# public Subnet
resource "aws_subnet" "aws_public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true # Enable auto-assign public IP
  tags = {
    Name = "aws_public_subnet"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_igw"
  }
}

#  Route Table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

# Route Table Association
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.aws_public_subnet.id
  route_table_id = aws_route_table.my_rt.id

}
