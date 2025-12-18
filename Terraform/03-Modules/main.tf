# dev Infrastructure Module
module "dev-infra" {
       source = "./infra-app"
       env = "dev"
       bucket_name = "abhijit-app-bucket-12345"
       instance_count = 1
       instance_type = "t2.micro"
       ec2_ami_id = "ami-02b8269d5e85954ef" # Ubuntu 20.04 (us-east-1)
       hash_key = "studentID"
       table_name = "abhijit-app-table"
}

# prod Infrastructure Module
module "prd-infra" {
       source = "./infra-app"
       env = "prd"
       bucket_name = "abhijit-app-bucket-12345"
       instance_count = 2
       instance_type = "t2.medium"
       ec2_ami_id = "ami-02b8269d5e85954ef" # Ubuntu 20.04 (us-east-1)
       hash_key = "studentID"
       table_name = "abhijit-app-table"
}


module "stg-infra" {
       source = "./infra-app"
       env = "stg"
       bucket_name = "abhijit-app-bucket-12345"
       instance_count = 1
       instance_type = "t2.small"
       ec2_ami_id = "ami-02b8269d5e85954ef" # Ubuntu 20.04 (us-east-1)
       hash_key = "studentID"
       table_name = "abhijit-app-table"
}



