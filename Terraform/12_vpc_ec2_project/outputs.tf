output "instance_public_ip" {
       description = "The Public IP address of Ec2 Intance"
       value = aws_instance.nginx_instance1.public_ip 
}

#output "instance_public_dns" {
#       description = "The Public DNS of Ec2 Instance"
#       value = aws_instance.nginx_instance.public_dns
#}
#output "vpc_id" {
#       description = "The ID of the VPC"
#       value = aws_vpc.my_vpc.id
#}
#output "public_subnet_id" {
#       description = "The ID of the Public Subnet"
#       value = aws_subnet.my_public_subnet.id
#}
#output "security_group_id" {
#       description = "The ID of the Security Group"
#       value = aws_security_group.nginx_sg.id

output "instance_url" {
       description = "The URL to access Nginx server"
       value = "http://${aws_instance.nginx_instance1.public_ip}"
}