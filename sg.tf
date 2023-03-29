resource "aws_security_group" "fargate_security_group" {
  name_prefix = "fargate-sg"
  vpc_id      = aws_vpc.fargate_vpc.id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
