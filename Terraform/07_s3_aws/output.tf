output "random_bucket_id" {
       value = random_id.random_bucket_id.hex
       description = "The random ID generated for the S3 bucket name"
}

output "s3_bucket_name" {
       value = aws_s3_bucket.demo_bucket.bucket
       description = "The name of the S3 bucket created"
}

output "s3_bucket_region" {
       value = aws_s3_bucket.demo_bucket.region
       description = "The region where the S3 bucket is created"
}