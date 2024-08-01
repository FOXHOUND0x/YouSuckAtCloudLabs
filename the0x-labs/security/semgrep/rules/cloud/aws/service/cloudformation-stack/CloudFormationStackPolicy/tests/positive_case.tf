resource "aws_cloudformation_stack" "stack_with_policy" {
  name          = "stack-with-policy"
  template_body = <<EOF
  {
    "Resources": {
      "MyBucket": {
        "Type": "AWS::S3::Bucket"
      }
    }
  }
  EOF
  policy_url = "https://example.com/my-policy"  # Policy URL is set
}
