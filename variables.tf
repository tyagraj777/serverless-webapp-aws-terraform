variable "region" {
  description = "AWS region"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "serverless-web-app-lambda"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "UsersTable"
}

variable "lambda_runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.8"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

