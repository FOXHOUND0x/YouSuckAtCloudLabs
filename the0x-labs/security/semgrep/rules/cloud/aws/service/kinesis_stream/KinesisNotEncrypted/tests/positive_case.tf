resource "aws_kinesis_stream" "example" {
  name              = "example-stream"
  shard_count       = 1
  retention_period  = 24

  encryption_type = "NONE"  # Kinesis stream is not encrypted
}
