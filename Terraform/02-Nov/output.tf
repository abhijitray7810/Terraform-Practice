output "ec2_public_id" {
       value = aws_instance.my_ec2_instance[*].public_ip # this is interpretation
               #1.instance-type 2.instance_type 3.instance public_ip
       description = "Public IP of the EC2 instance"

}

output "ec2_instance_dns" {
       value = aws_instance.my_ec2_instance[*].public_dns
       description = "Public DNS of the EC2 instance"
}

output "ec2_instance_id" {
       value = aws_instance.my_ec2_instance.id
       description = "ID of the EC2 instance"
}

output "ec2_instance_private_ip" {
       value = aws_instance.my_ec2_instance[*].private_ip
       description = "Private IP of the EC2 instance"
}

output "ec2_instance_name" {
       value = aws_instance.my_ec2_instance.tags["Name"]
       description = "Name tag of the EC2 instance"
}

output "ec2_terra_key_name" {
       value = aws_key_pair.my_key.key_name
       description = "Name of the Key Pair used for the EC2 instance"
}