variable "ami" {
       default = "ami-00f943f626f580b28"
       type = string
       description = "this is aws ami number"
}

variable "instance_type" {
       default = "t2.nano"
       type = string
       description = "this is my ec2 instance instance type"

}

variable "region" {
       default = "sa-east-1"
       type = string
       description = "The AWS region to deploy resources in"
}
