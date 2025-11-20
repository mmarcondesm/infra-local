resource "aws_s3_bucket" "local_bucket" {
  bucket = var.bucket_name
}
