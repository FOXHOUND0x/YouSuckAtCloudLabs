resource "aws_ecs_task_definition" "example" {
  family                   = "example-task"
  container_definitions    = jsonencode([{
    name  = "example-container"
    image = "example-image"
    memory = 512
    cpu    = 256
  }])

  volume {
    name = "example-volume"
    efs_volume_configuration {
      file_system_id = "fs-12345678"
      transit_encryption = false  # In-transit encryption is disabled
    }
  }
}
