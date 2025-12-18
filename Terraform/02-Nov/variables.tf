variable "ec2_instance_type"{
       default = "t2.micro"
       type = string
       description = "Type of EC2 instance to create"
}

variable "ec2_ami_id"{
       default = "ami-02b8269d5e85954ef"
       type = string
       description = "AMI ID for the EC2 instance"
}

variable "ec2_root_storage_size" {
       default = 8
       type = number
       description = "Root storage size in GB for the EC2 instance"
}

variable "ec2_instance_name" {
       default = "MyFirstEC2Instance"
       type = string
       description = "Name tag for the EC2 instance"
}
