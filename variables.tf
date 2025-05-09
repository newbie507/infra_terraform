variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "azure_storage_account_url" {
  type    = string
}

variable "s3_bucket_name" {
  type    = string
}

variable "blob_to_s3_target_bucket_name" {
  description = "Azure Blob → S3 복제용 대상 S3 버킷 이름"
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage Account name"
  type        = string
}

variable "azure_storage_account_key" {
  description = "Azure Storage Account Key"
  type        = string
  sensitive   = true
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Azure 리소스 그룹 이름"
  type        = string
}

variable "location" {
  description = "Azure 리전"
  type        = string
  default     = "Korea Central"
}

variable "source_container_name" {
  description = "Blob → S3 복제의 소스 컨테이너 이름"
  type        = string
}

variable "target_container_name" {
  description = "S3 → Blob 복제의 타깃 컨테이너 이름"
  type        = string
}