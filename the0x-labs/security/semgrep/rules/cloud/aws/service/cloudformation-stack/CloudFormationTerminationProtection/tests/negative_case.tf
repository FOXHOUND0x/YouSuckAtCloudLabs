resource "aws_cloudformation_stack" "protected" {
  name          = "protected-stack"
  template_body = <<EOF
  {
    "Resources": {
      "MyBucket": {
        "Type": "AWS::S3::Bucket"
      }
    }
  }
  EOF
  
}
