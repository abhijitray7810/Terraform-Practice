output "instance_id" {
  value       = aws_instance.ec2_instance.id
  description = "This is my ec2 instance "

}
output "instance_type" {
  value       = aws_instance.ec2_instance.instance_type
  description = "Type of the EC2 instance"
}
output "instance_ami" {
  value       = aws_instance.ec2_instance.ami
  description = "AMI ID of the EC2 instance"
}
output "instance_tags" {
  value       = aws_instance.ec2_instance.tags
  description = "Tags associated with the EC2 instance"
}
output "instance_public_ip" {
  value       = aws_instance.ec2_instance.public_ip
  description = "Public IP address of the EC2 instance"
}