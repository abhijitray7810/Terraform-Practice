# Create a Security Group
resource "aws_security_group" "nginx_sg" {
       vpc_id = aws_vpc.my_vpc.id
# Allow inbound HTTP traffic
       ingress {
              from_port  = 80
              to_port    = 80 
              protocol   = "tcp" # HTTP
              cidr_blocks = ["0.0.0.0/0"] # allow from anywhere
       }
# Allow all outbound traffic
       egress {
              from_port  = 0
              to_port    = 0
              protocol   = "-1" # all protocols
              cidr_blocks = ["0.0.0.0/0"] # allow all outbound

}
        tags = {
              Name = "nginx_sg"
        }
}