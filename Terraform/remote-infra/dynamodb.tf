resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "basic-dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID" # Partition key

  attribute {
    name = "LockID"
    type = "S"
  }

  
  tags = {
    Name        = "basic-dynamodb-table"
  }
}