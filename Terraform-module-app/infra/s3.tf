resource "aws_s3_bucket" "my_s3_bucket2404" {
  bucket = "${var.env}-bucket-2404"

  tags = {
    Name        = "${var.env}-bucket-2404"
    Environment = var.env
  }
}