resource "aws_kinesis_stream" "secured" {
  name              = "secured-stream"
  shard_count       = 1
  retention_period  = 24

  encryption_type = "KMS"  # Kinesis stream is encrypted with KMS
}
