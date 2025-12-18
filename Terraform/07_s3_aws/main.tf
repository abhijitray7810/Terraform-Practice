resource "aws_s3_bucket" "demo_bucket" {
  bucket = "demo-bucket-${random_id.random_bucket_id.hex}" # ekhane ami random id use korchi jar karone prottekbar notun bucket name create hobe
}

resource "aws_s3_object" "bucket_data" {
       bucket = aws_s3_bucket.demo_bucket.bucket
       source = "./word.txt" # ai file ta amar local machine theke upload korbo
       key    = "word.txt" # ai file ta s3 te kemon name e thakbe 
}

resource "random_id" "random_bucket_id" {
       byte_length = 8
       
}

