resource "aws_s3_bucket" "shourya" {
  bucket = "shourya-test-bucket-2401"

  tags = {
    name : "Test"
    environment : "dev"
  }
}
