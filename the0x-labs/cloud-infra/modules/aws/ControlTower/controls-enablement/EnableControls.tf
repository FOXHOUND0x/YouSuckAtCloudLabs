resource "aws_controltower_control" "enable_control" {
    control_identifier = "arn:aws:controltower:${data.aws_region.current.name}::control/${var.control_identifier}"
    target_identifier = var.target_identifier
}