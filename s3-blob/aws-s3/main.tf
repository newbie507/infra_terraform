resource "aws_s3_bucket" "drplan_source" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket" "drplan_target" {
  bucket = var.blob_to_s3_target_bucket_name
}

resource "aws_s3_bucket_public_access_block" "drplan_target" {
  bucket = aws_s3_bucket.drplan_target.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
