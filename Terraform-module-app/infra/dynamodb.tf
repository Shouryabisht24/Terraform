resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "${var.env}-dynamodb-table"
  billing_mode = var.billing_mode
  hash_key     = "LockId"
  attribute {
    name = "LockId"
    type = "S"
  }
  tags = {
    Name        = "${var.env}-table"
    Environment = var.env
  }
}