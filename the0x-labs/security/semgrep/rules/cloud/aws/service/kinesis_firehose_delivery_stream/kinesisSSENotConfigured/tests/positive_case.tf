resource "aws_kinesis_firehose_delivery_stream" "example" {
  name        = "example-delivery-stream"
  destination = "s3"

  # No server-side encryption configured
}
