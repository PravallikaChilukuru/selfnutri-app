output "frontend_bucket" {
  description = "Frontend S3 bucket"
  value       = aws_s3_bucket.frontend.bucket
}

output "data_bucket" {
  description = "Data S3 bucket"
  value       = aws_s3_bucket.data.bucket
}

output "api_gateway_url" {
  description = "API Gateway invoke URL"
  value       = aws_apigatewayv2_stage.default.invoke_url
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = var.cloudfront_distribution_id
}

output "cloudfront_url" {
  description = "CloudFront URL for frontend"
  value       = "https://d3tuac21giuzpq.cloudfront.net"
}
