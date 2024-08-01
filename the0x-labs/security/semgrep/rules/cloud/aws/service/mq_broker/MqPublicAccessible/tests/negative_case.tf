resource "aws_mq_broker" "example" {
  broker_name = "example-broker"
  engine_version = "5.15.14"
  engine_type = "ACTIVEMQ"
  deployment_mode = "SINGLE_INSTANCE"
  host_instance_type = "mq.t2.micro"
  publicly_accessible = false
  user {
    username = "example-user"
    password = "example-password"
  }
  logs {
    general = false  # General logging is disabled
  }
}
