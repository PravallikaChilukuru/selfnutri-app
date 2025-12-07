variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "s3_frontend_bucket_name" {
  description = "S3 bucket for frontend assets"
  default     = "selfnutri-frontend-rchilukuru"
}

variable "s3_data_bucket_name" {
  description = "S3 bucket for app data"
  default     = "selfnutri-data-rchilukuru"
}

variable "api_gateway_name" {
  description = "API Gateway name"
  default     = "selfnutri-final-api"
}

variable "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  default     = "E21L1ZDOAHZJ3L"
}
