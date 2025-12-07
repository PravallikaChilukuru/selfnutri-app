# ---------- Frontend S3 Bucket ----------
resource "aws_s3_bucket" "frontend" {
  bucket = var.s3_frontend_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "SelfNutri Frontend Bucket"
  }
}

# ---------- Data S3 Bucket ----------
resource "aws_s3_bucket" "data" {
  bucket = var.s3_data_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name = "SelfNutri Data Bucket"
  }
}

# ---------- API Gateway ----------
resource "aws_apigatewayv2_api" "selfnutri" {
  name          = var.api_gateway_name
  protocol_type = "HTTP"
  description   = "Self Nutri backend API"
}

# Default stage for API Gateway
resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.selfnutri.id
  name        = "$default"
  auto_deploy = true
}
