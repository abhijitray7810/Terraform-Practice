output "s3_bucket_name" {
       value = aws_s3_bucket.subsite2_bucket.bucket
       description = "The name of the S3 bucket created for subsite2"
}
output "s3_bucket_website_endpoint" {
       value = aws_s3_bucket_website_configuration.subsite2-website.website_endpoint
       description = "The website endpoint of the S3 bucket for subsite2"
}
output "s3_bucket_region" {
       value = aws_s3_bucket.subsite2_bucket.region
       description = "The region where the S3 bucket for subsite2 is created"
}