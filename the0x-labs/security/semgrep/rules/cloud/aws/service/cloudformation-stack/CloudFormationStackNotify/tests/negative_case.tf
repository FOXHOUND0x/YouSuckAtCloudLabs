resource "aws_cloudformation_stack" "notified" {
  name          = "notified-stack"
  template_body = <<EOF
  {
    "Resources": {
      "MyBucket": {
        "Type": "AWS::S3::Bucket"
      }
    }
  }
  EOF
  notification_arns = ["arn:aws:sns:us-east-1:123456789012:MyTopic"]  
}
