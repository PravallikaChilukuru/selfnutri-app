# --------------------------
# Existing S3 Buckets (Referenced, NOT Created)
# --------------------------

# Use data sources to reference existing buckets
# This assumes 'var.s3_frontend_bucket_name' and 'var.s3_data_bucket_name'
# are defined in your variables.tf with the correct bucket names.
data "aws_s3_bucket" "frontend" {
  bucket = var.s3_frontend_bucket_name
}

data "aws_s3_bucket" "data" {
  bucket = var.s3_data_bucket_name
}

# --------------------------
# API Gateway (To be created/managed)
# --------------------------
resource "aws_apigatewayv2_api" "selfnutri" {
  name          = var.api_gateway_name
  protocol_type = "HTTP"
  description   = "Self Nutri backend API"
}

# Default stage for API Gateway (To be created/managed)
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.selfnutri.id
  name        = "$default"
  auto_deploy = true
}
