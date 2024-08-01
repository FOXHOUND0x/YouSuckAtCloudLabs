resource "aws_ecs_service" "example" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 1
  
  iam_role = "arn:aws:iam::123456789012:role/Admin"  # Admin role specified
}
