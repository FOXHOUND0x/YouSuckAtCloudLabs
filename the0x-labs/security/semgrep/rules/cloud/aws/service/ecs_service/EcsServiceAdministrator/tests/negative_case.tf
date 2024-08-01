resource "aws_ecs_service" "secured" {
  name            = "secured-service"
  cluster         = aws_ecs_cluster.secured.id
  task_definition = aws_ecs_task_definition.secured.arn
  desired_count   = 1
  
  iam_role = "arn:aws:iam::123456789012:role/NonAdminRole"  # Non-admin role specified
}
