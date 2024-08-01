resource "aws_sagemaker_notebook_instance" "example" {
  name                = "example-notebook"
  instance_type      = "ml.t2.medium"
  role_arn           = "arn:aws:iam::123456789012:role/service-role/AmazonSageMaker-ExecutionRole"

  root_access = "Enabled"  # Indicates the instance is not encrypted
}
