variable "s3_bucket_name" {
  description = "Name of the S3 bucket for S3 → Blob"
  type        = string
}

variable "blob_to_s3_target_bucket_name" {
  description = "Name of the S3 bucket for Blob → S3"
  type        = string
}

# variable "azure_storage_account_url" {
#   type        = string
#   description = "Azure Blob Storage Account URL"
# }

# variable "azure_container_name" {
#   type        = string
#   description = "Azure container name"
# }

