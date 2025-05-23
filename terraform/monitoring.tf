# 1. Ativar logs e métricas detalhadas para o API Gateway
resource "aws_api_gateway_account" "account" {
  cloudwatch_role_arn = aws_iam_role.api_gateway_cloudwatch_role.arn
}

resource "aws_iam_role" "api_gateway_cloudwatch_role" {
  name = "api-gateway-cloudwatch-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "apigateway.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "api_gateway_cloudwatch_policy" {
  role = aws_iam_role.api_gateway_cloudwatch_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      Resource = "*"
    }]
  })
}

# 2. Lambda já envia métricas para CloudWatch automaticamente

# 5. Dashboard exemplo
resource "aws_cloudwatch_dashboard" "api_dashboard" {
  dashboard_name = "CreditScoreApiDashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0, y = 0, width = 12, height = 6,
        properties = {
          metrics = [
            ["AWS/Lambda", "Invocations", "FunctionName", aws_lambda_function.lambda_func.function_name],
            [".", "Errors", ".", "."]
          ],
          period = 60,
          stat   = "Sum",
          region = var.region,
          title  = "Lambda Invocations and Errors"
        }
      },
      {
        type = "metric",
        x    = 0, y = 6, width = 12, height = 6,
        properties = {
          metrics = [
            ["AWS/ApiGateway", "4XXError", "ApiName", aws_api_gateway_rest_api.api.name],
            [".", "5XXError", ".", "."]
          ],
          period = 60,
          stat   = "Sum",
          region = var.region,
          title  = "API Gateway Errors"
        }
      }
    ]
  })
}
