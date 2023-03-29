resource "aws_vpc" "ecs_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ecs-vpc"
  }
}

resource "aws_subnet" "ecs_subnet_1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.ecs_vpc.id

  tags = {
    Name = "ecs-subnet-1"
  }
}

resource "aws_subnet" "ecs_subnet_2" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.ecs_vpc.id

  tags = {
    Name = "ecs-subnet-2"
  }
}
