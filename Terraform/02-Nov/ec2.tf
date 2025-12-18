# Create Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub") # fixed typo: 'pubilc_key' → 'public_key'
}

# Create Default VPC
resource "aws_default_vpc" "default" {}

# Create Security Group
resource "aws_security_group" "my_security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

  # inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Connections"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Node app"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "allow_tls"
  }
}

# Create EC2 instance
resource "aws_instance" "my_ec2_instance" {
  count                  = 3
  ami                    = var.ec2_ami_id# Ubuntu 20.04 (us-east-1)
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id] # use .id, not .name

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3" # fixed typo: 'volumwe_type' → 'volume_type'
  }

  tags = {
    Name = var.ec2_instance_name
  }
}
