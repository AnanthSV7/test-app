resource "aws_ecs_cluster" "fargate_cluster" {
  name = "my-fargate-cluster" # Replace with your desired cluster name
}

# Define the ECS task definition
resource "aws_ecs_task_definition" "fargate_task_definition" {
  family                   = "my-fargate-task" # Replace with your desired task family name
  container_definitions    = jsonencode([{
    name      = "test-app" # Replace with your desired container name
    image     = "test-app"       # Replace with your desired Docker image
    cpu       = 256           # Replace with your desired CPU units
    memory    = 512           # Replace with your desired memory in MiB
    portMappings = [{
      containerPort = 3000     # Replace with your desired container port
      hostPort      = 3000     # Replace with your desired host port
    }]
  }])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "1GB"
  cpu                      = "256"
}

# Define the ECS Fargate service
resource "aws_ecs_service" "fargate_service" {
  name            = "my-fargate-service" # Replace with your desired service name
  cluster         = aws_ecs_cluster.my-fargate-service.id
  task_definition = aws_ecs_task_definition.fargate_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.fargate_subnet.id]
    security_groups  = [aws_security_group.fargate_security_group.id]
    assign_public_ip = true
  }
}
