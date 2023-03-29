resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name      = "demo-app"
      image     = "demo-app:latest"
      memory    = 512
      cpu       = 256
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.demo-app.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  desired_count   = 1

  network_configuration {
    subnets = [
      aws_subnet.ecs_subnet_1.id,
      aws_subnet.ecs_subnet_2.id
    ]

    security_groups = [
      aws_security_group.ecs_security_group.id
    ]

    assign_public_ip = "ENABLED"
  }
}
