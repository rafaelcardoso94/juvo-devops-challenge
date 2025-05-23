resource "aws_dynamodb_table" "score_cache" {
  name         = "score-cache"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "cpf"

  attribute {
    name = "cpf"
    type = "S"
  }

}

data "aws_iam_policy_document" "lambda_dynamodb_policy" {
  statement {
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:Query",
    ]
    resources = [aws_dynamodb_table.score_cache.arn]
  }
}

resource "aws_iam_policy" "lambda_dynamodb_access" {
  name   = "lambda-dynamodb-access"
  policy = data.aws_iam_policy_document.lambda_dynamodb_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_access.arn
}