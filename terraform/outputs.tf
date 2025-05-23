output "api_endpoint" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/prod"
}

output "score_endpoint" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/prod/v1/score"
}

output "healthcheck_endpoint" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/prod/v1/health"
}

output "api_key_value" {
  value       = aws_api_gateway_api_key.score_api_key.value
  description = "A API Key para uso no header x-api-key"
  sensitive   = true
}