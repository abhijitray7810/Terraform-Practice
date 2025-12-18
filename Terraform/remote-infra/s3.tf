resource "aws_s3_bucket" "remote_infra_bucket" {
  bucket = "my-remote-infra-bucket-abhijit-2025"
  

  tags = {
    Name        = "my-remote-infra-bucket-abhijit-2025"
    
  }

}