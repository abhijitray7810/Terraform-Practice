module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"


  name = "single-instance"

  instance_type = "t3.micro"
  ami = "ami-068c0051b15cdb816"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "single-instance-tf"
    Environment = "dev"
  }
}
