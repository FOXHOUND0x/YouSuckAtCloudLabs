resource "aws_sagemaker_notebook_instance" "secured" {
  name                = "secured-notebook"
  instance_type      = "ml.t2.medium"
  role_arn           = "arn:aws:iam::123456789012:role/service-role/AmazonSageMaker-ExecutionRole"

  root_access = "Disabled"  # Indicates the instance is encrypted
}
