terraform {}

locals {
  value = "Hello, Terraform!"
}

variable "string_list" {
  type    = list(string)
  default = ["one", "two", "three", "four", "five"]
}
output "local_value" {
  # value = lower (local.value)
  # value = upper (local.value)
  #value = startswith(local.value, "Hello")
  #value = split("  ", local.value)
  #value = max(1,2,3,4,5,6,6,7,7,7,)
  #value = min(1,2,3,4,5,6,6,7,7,7,)
  #value = abs(-10)
  #value = length(var.string_list)
  #value = join(":", var.string_list)
  #value = contains(var.string_list, "three")
  #value = contains(var.string_list, "ten")
  #value = index(var.string_list, "three")
  #value = var.string_list
  #value = var.string_list[1]
  #value = slice(var.string_list, 1,4)
  value = toset(var.string_list)
  

}
