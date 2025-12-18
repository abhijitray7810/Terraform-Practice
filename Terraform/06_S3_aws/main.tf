resource "aws_s3_bucket" "demo_bucket" {
 # bucket = var.s3_bucket_name
}

resource "aws_s3_object" "bucket_data" {
       bucket = aws_s3_bucket.demo_bucket.bucket
       source = "./mys3.txt" # ai file ta amar local machine theke upload korbo
       key    = "mys3.txt" # ai file ta s3 te kemon name e thakbe 
}

resource "random_id" "random_bucket_id" {
       byte_length = 8
       
}