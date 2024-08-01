resource "aws_ecs_task_definition" "secured" {
  family                   = "secured-task"
  container_definitions    = jsonencode([{
    name  = "secured-container"
    image = "secured-image"
    memory = 512
    cpu    = 256
  }])

  volume {
    name = "secured-volume"
    efs_volume_configuration {
      file_system_id = "fs-87654321"
      transit_encryption = true  # In-transit encryption is enabled
    }
  }
}
