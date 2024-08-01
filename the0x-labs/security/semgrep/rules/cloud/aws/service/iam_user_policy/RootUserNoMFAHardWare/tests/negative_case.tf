# resource "aws_iam_virtual_mfa_device" "hardware_mfa" {
#   virtual_mfa_device_name = "root-mfa"
#   path                    = "/root"
  
#   # Hardware MFA device is enabled
#   type = "hardware"  # Hardware MFA device specified
# }

# resource "aws_iam_user" "root" {
#   name = "root"

#   mfa_devices = [aws_iam_virtual_mfa_device.hardware_mfa.id]  # Hardware MFA device attached
# }
