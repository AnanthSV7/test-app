resource "aws_vpc" "fargate_vpc" {
  cidr_block = "10.0.0.0/16" # Replace with your desired CIDR block
}

resource "aws_subnet" "fargate_subnet" {
  vpc_id     = aws_vpc.fargate_vpc.id
  cidr_block = "10.0.1.0/24" # Replace with your desired CIDR block
}
