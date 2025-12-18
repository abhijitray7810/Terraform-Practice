# Create Ec2 instance for Nginx setup
resource "aws_instance" "nginx_instance1" {
       ami = "ami-077aec33f15de0896"
       instance_type = "t2.micro"
       subnet_id = aws_subnet.my_public_subnet.id
       # security_groups = [aws_security_group.nginx_sg.name]
       vpc_security_group_ids = [aws_security_group.nginx_sg.id]
       associate_public_ip_address = true

       
       user_data = <<-EOF
                     #!/bin/bash
                     sudo apt update
                     sudo apt install nginx -y
                     sudo systemctl start nginx
                     sudo systemctl enable nginx
                     EOF



       tags = {
              Name = "nginx_instance"
       }
}