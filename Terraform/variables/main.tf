resource "aws_instance" "ec2_instance" {
  ami           = var.aws_ami_id
  instance_type = var.aws_instance_type

  root_block_device {
    volume_size           = var.root_block_device.volume_size
    volume_type           = var.root_block_device.volume_type
    delete_on_termination = true
  }

  tags = merge(var.additinal_tags, {
    Name = "TerraformEC2Instance"
  })
}
