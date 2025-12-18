variable "vpc_config" {
  description = "CIDR tumi nija dao"
  type = object({
    cidr_block = string
    name       = string
    azs        = list(string)
  })
}

# subnet 
variable "subnet_config" {
       description = "Subnet gular configuration"
       # subnet 1 = {cidr=..., azs=....}
       # subnet 2 = {cidr=..., azs=....}
       # subnet 3 = {cidr=..., azs=....}
       type = map(object({
          cidr_block = string
               azs   = string 
       }))
}
