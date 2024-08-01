resource "aws_kinesis_firehose_delivery_stream" "secured" {
  name        = "secured-delivery-stream"
  destination = "s3"

  server_side_encryption {
    key_arn = "arn:aws:kms:us-east-1:123456789012:key/my-kms-key-id"  # SSE configured
  }
}
