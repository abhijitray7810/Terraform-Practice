# Create EC2 Instance 
resource "aws_instance" "mynginxserver" {
  ami                         = "ami-00769f46ca3bb4381"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.my_public_subnet_tf.id
  vpc_security_group_ids      = [aws_security_group.my_security_group_tf.id]
  associate_public_ip_address = true
  user_data = <<-EOF
                     #!/bin/bash
                     sudo apt update -y
                     sudo apt install nginx -y
                     sudo systemctl enable nginx
                     sudo systemctl start nginx
                     
                     EOF

  tags = {
    Name = "Nginx_Server"
  }
}
