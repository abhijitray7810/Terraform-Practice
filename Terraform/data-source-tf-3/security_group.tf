resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "Security group for my VPC"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}
# outgress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
       tags = {
       Name = "my_security_group"
       }
}