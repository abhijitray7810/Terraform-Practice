terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
locals {
  user_data = yamldecode(file("./User.yml")).users


  user_role_pair = flatten([for user in local.user_data : [
    for role in user.roles : {
      username = user.username
      role     = role
    }
  ]])
  }


output "output_user_data" {
  value = local.user_data[*].username

}
output "output_user_role_pair" {
  value = local.user_role_pair[*].role
}

# Create IAM users based on the YAML file
resource "aws_iam_user" "users" {
  for_each = toset(local.user_data[*].username)
  name = each.value
}
# Password policy attachment
resource "aws_iam_user_login_profile" "password_policy" {
  for_each = aws_iam_user.users
  #minimum_password_length = 12
  #require_symbols        = true
  #require_numbers        = true
  password_length = 12
  user            = each.value.name

  lifecycle {
    ignore_changes = [ 
      password_length,
      password_reset_required,
      pgp_key,
     ]
  }
}

 #Attach Policies to users based on the YAML file
#resource "aws_iam_user_policy_attachment" "user_policy_attachments" {
#  for_each = {
#    for user in local.user_data :
#    user.username => user.roles
#  }
#
#  user       = aws_iam_user.users[each.key].name
#  policy_arn = "arn:aws:iam::aws:policy/${each.value[count.index]}"
#}
#output "output_user_roles" {
#  value = local.user_data[*].roles
#
#}


# Attaching policies to users based on the YAML file
resource "aws_iam_user_policy_attachment" "user_policy_attachments" { 
  for_each = {
    for pair in local.user_role_pair :
      "${pair.username}-${pair.role}" => pair

  }
  user = aws_iam_user.users[each.value.username].name
  policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"
}
