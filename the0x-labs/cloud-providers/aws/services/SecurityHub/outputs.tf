output "caller_identity" {
    value = "${data.aws_caller_identity.current.arn}"
}