data "archive_file" "welcome" {
  type        = "zip"
  source_file = "welcome.py"
  output_path = "outputs/welcome.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "outputs/welcome.zip.zip"
  function_name = "welcome"
  role          = aws_iam_role.lambda_role.arn
  handler       = "welcome.hello"

#  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "Python 3.9.0"
}
