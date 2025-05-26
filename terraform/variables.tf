variable "region" {
  type    = string
  default = "us-east-1"
}

variable "repository_name" {
  type    = string
  default = "credit-score-api"
}

variable "lambda_role_name" {
  type    = string
  default = "lambda-exec-role"
}

variable "lambda_function_name" {
  type    = string
  default = "credit-score-api"
}

variable "api_name" {
  type    = string
  default = "credit-score-api"
}
