#output "my_ec2_instance" {
#      value = aws_instance.my_instance.my_ec2_instance
#      description = "this is "
# 
#}
#output "my_security_group" {
#       value = aws_security_group.my_sg.id
#       description = "this is "
  
#}

output "my_vpc_id" {
       value = aws_vpc.my_vpc.id
       description = "this is "
  
}

output "my_public_subnet_id" {
       value = aws_subnet.aws_public_subnet.id
       description = "this is "
  
}
output "my_private_subnet_id" {
       value = aws_subnet.private_subnet.id
       description = "this is "
  
}
output "my_internet_gateway_id" {
       value = aws_internet_gateway.igw.id
       description = "this is "
  
}
output "my_route_table_id" {
       value = aws_route_table.my_rt.id
       description = "this is "
  
}
output "my_route_table_association_id" {
       value = aws_route_table_association.public_rt_assoc.id
       description = "this is "
  
}
