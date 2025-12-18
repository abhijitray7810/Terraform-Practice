resource "aws_security_group" "my_security_group_tf" {
  vpc_id = aws_vpc.my_vpc_tf.id

  # Allow inbound HTTP traffic
  # inbound rule
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }
  # Allow all outbound traffic
  # outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "my_security_group_tf"
  }
}
