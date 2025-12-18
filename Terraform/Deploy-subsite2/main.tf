resource "aws_s3_bucket" "subsite2_bucket" {
  bucket = "royal-furnitures-india"

}

resource "aws_s3_bucket_public_access_block" "subsite2_public_" {
  bucket = aws_s3_bucket.subsite2_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.subsite2_bucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect    = "Allow"
          Principal = "*"
          Action = [
            "s3:GetObject"
          ]
          Resource = "${aws_s3_bucket.subsite2_bucket.arn}/*"
        }
      ]
    }
  )

}
resource "aws_s3_bucket_website_configuration" "subsite2-website" {
  bucket = aws_s3_bucket.subsite2_bucket.id

  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_object" "subsite2_bucket_data" {
  bucket       = aws_s3_bucket.subsite2_bucket.bucket
  source       = "./index.html"
  key          = "index.html"
  content_type = "text/html"
}
