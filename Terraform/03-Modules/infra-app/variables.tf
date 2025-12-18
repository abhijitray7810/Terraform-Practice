variable "env" {

       description = "the environment for resource"
       type =string
}


variable "bucket_name" {
       description = "this is my bucket name for infra resource"
       type = string
}

variable "instance_count" {
       description = "number of ec2 instance to launch"
       type = number
}

variable "instance_type" {
       description = "this is infra-app instance type"
       type = string
}

variable "ec2_ami_id" {
       description = "this is infra-app ec2 ami id"
       type = string
}

variable "hash_key" {
       description = "this is hash key for dynamodb table"
       type = string
}

variable "table_name" {
       description = "this is my table name for infra resource"
       type = string
}
