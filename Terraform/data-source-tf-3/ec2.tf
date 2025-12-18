# ec2 instance using data source
resource "aws_instance" "my_instance" {
  ami           = "ami-0ebf411a80b6b22cb" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.aws_public_subnet.id
  #vpc_security_group_ids = [aws_security_group.my_sg.id]
  associate_public_ip_address = true
  security_groups = [ aws_security_group.my_sg.id ]

  tags = {
    Name = "my_ec2_instance"
  }
}