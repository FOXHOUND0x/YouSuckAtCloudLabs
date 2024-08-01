resource "aws_ecs_task_definition" "example" {
  family                   = "example-task"
  container_definitions    = jsonencode([{
    name  = "example-container"
    image = "example-image"
    memory = 512
    cpu    = 256

    environment = [
      {
        name  = "PASSWORD"  # Sensitive information found
        value = "my-secret-password"
      }
    ]
  }])
}
