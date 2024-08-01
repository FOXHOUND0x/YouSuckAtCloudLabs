resource "aws_launch_configuration" "secured" {
  name          = "secured-launch-configuration"
  image_id      = "ami-87654321"
  instance_type = "t2.micro"

  user_data = <<EOF
  #!/bin/bash
  echo "This is a secure script."
  # No private keys included
  EOF  # Not encoded, should not trigger warning
}
EOF
}