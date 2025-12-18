variable "aws_instance_type" {
  description = "The type of AWS EC2 instance to use"
  type        = string
  #default     = "t2.micro"
  validation {
    condition     = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro" || var.aws_instance_type == "t3a.micro" # ar mane holo ai 3 ta instance type ar modha instance deta hobe.. limit kora holo
    error_message = "Instance type must be one of: t2.micro, t3.micro, t3a.micro"
  }
}
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}
variable "aws_ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-00f46ccd1cbfb363e"
}
#variable "instance_name" {
#  type        = string
#  description = "The name tag for the EC2 instance"
#}
  #default     = "MyEC2Instance"
#variable "instance_volume_size" {
#  description = "this is my instance volume size"
#  type        = number
#  validation {
#    condition = var.instance_volume_size >= 8 && var.instance_volume_size <= 64
#    error_message = "Volume size must be between 8 and 64 GB"
#  }
#
#}
variable "root_block_device" {
  type = object({
    volume_size = number
    volume_type = string
  })
  default = {
    volume_size = 20
    volume_type = "gp2"
  }

}

variable "additinal_tags" {
  type = map(string)
  default = {}
}