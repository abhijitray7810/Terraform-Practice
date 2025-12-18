variable "region" {
  description = "The AWS region to deploy resources in"
  default = "sa-east-1"
  type = string
}


variable "ami" {
       description = "this is aws ami number"
       default = "ami-00f943f626f580b28"
       type = string
}

variable "instance_type" {
       description = "this is aws instance type"
       default = "t2.nano"
       type = string
}