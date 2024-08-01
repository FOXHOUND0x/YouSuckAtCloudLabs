resource "aws_launch_configuration" "example" {
  name          = "example-launch-configuration"
  image_id      = "ami-12345678"
  instance_type = "t2.micro"

  user_data = base64decode("IyEvYmluL2Jhc2gKZWNobyAiVGhpcyBpcyBhIHNjcmlwdCIK")  # Base64 encoded shell script
}
