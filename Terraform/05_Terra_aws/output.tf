output "aws_instance_public_ip" {
       value = aws_instance.MyFirstEC2Instance.public_ip
}
output "aws_instance_id" {
       value = aws_instance.MyFirstEC2Instance.id
}

output "aws_instance_public_dns" {
       value = aws_instance.MyFirstEC2Instance.public_dns
}

output "aws_instance_ami" {
       value = aws_instance.MyFirstEC2Instance.ami
}

output "aws_instance_type" {
       value = aws_instance.MyFirstEC2Instance.instance_type
}