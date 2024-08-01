resource "aws_ecs_task_definition" "secured" {
  family                   = "secured-task"
  container_definitions    = jsonencode([{
    name  = "secured-container"
    image = "secured-image"
    memory = 512
    cpu    = 256

    environment = [
      {
        name  = "DB_USER"
        value = "db_user"
      }
    ]
  }])
}
