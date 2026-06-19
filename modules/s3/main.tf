resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_public_access_block" "s3-pcb" {
  bucket = aws_s3_bucket.my-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.my-bucket.id

  versioning_configuration {
    status = var.versioning_enabled
  }
}
