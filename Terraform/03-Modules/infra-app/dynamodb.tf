resource "aws_dynamodb_table" "app_table" {
  name           = "${var.env}-${var.table_name}"
  billing_mode   = "PAY_PER_REQUEST"

  # Define the primary key
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.env}-infra-app-table"
    Environment = var.env
  }
}
