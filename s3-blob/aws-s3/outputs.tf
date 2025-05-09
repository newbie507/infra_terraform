output "s3_bucket_name" {
  value = aws_s3_bucket.drplan_source.id
}

output "blob_to_s3_target_bucket_name" {
  value = aws_s3_bucket.drplan_target.id
}
