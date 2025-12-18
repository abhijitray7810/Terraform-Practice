module "my_vpc_root" {
  source = "./modules/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my_root_vpc"
    azs        = ["us-east-1a", "us-east-1b"]
  }

  subnet_config = {
    public_1 = {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      type       = "public"
    }

    private_1 = {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
      type       = "private"
    }
  }
}
