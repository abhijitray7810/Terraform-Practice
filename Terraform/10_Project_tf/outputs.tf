output "Instance_public_ip" {
       description = "The public IP address of the EC2 instance"
       value = aws_instance.mynginxserver.public_ip
}

output "Instance_type" {
       description = "The type of the EC2 instance"
       value = aws_instance.mynginxserver.instance_type

}
output "Security_Group_ID" {
       description = "The ID of the security group"
       value = aws_security_group.my_security_group_tf.id
}

output "VPC_ID" {
       description = "The ID of the VPC"
       value = aws_vpc.my_vpc_tf.id
}
output "Public_Subnet_ID" {
       description = "The ID of the public subnet"
       value = aws_subnet.my_public_subnet_tf.id
}
output "Private_Subnet_ID" {
       description = "The ID of the private subnet"
       value = aws_subnet.my_private_subnet_tf.id
}

output "Internet_Gateway_ID" {
       description = "The ID of the Internet Gateway"
       value = aws_internet_gateway.my_igw_tf.id
}
output "Route_Table_ID" {
       description = "The ID of the Route Table"
       value = aws_route_table.my_route_table_tf.id
}
output "Route_Table_Association_ID" {
       description = "The ID of the Route Table Association"
       value = aws_route_table_association.my_route_table_association_tf.id
}
output "instance_url" {
       description = "the url to access the nginx server"
       value = "http://${aws_instance.mynginxserver.public_ip}"
}

output "Nginx_download_status" {
       description = "The status of Nginx service on the EC2 instance"
       value = "Nginx should be installed and running on the instance"
}