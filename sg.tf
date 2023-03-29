resource "aws_security_group" "ecs_security_group" {
  name_prefix = "ecs-security-group"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
