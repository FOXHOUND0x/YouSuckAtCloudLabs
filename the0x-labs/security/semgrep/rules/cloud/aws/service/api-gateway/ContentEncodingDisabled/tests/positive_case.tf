resource "aws_api_gateway_rest_api" "example_neg" {
  name        = "example-api-neg"
  description = "This API does not have content encoding enabled."

  # Minimum compression size set to -1, which is invalid
  minimum_compression_size = -1
}
