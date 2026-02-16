resource "aws_dynamodb_table" "test-dynamodb" {
  name         = "${var.my_enviroment}-test-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    environment = var.my_enviroment
  }
}

