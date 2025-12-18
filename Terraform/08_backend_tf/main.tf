resource "aws_instance" "my_ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  region        = var.region

  tags = {
    Name = "MyFirstEC2Instance"
  }

}
