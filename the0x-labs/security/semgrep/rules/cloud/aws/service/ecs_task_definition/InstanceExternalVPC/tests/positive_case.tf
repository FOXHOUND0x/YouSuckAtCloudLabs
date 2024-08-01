resource "aws_ecs_task_definition" "example" {
  family                   = "example-task"
  container_definitions    = jsonencode([{
    name  = "example-container"
    image = "example-image"
    memory = 512
    cpu    = 256
  }])

  network_mode = "bridge"  # Not using VPC
}
