variable "bucket_name" {
  type = string
}

variable "tags" {
  type = map
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = var.tags
}