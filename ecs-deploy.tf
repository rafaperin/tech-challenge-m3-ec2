provider "aws" {
  region = "us-east-1"  # Change to your preferred region
  access_key = var.tf_var_aws_access_key_id
  secret_key = var.tf_var_aws_secret_acess_key
}

resource "aws_ecr_repository" "my_ecr" {
  name = "ecr-modulo-3"
}

resource "aws_ecs_cluster" "my_cluster" {
  name = "cluster-ecs-m3"
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "my-ecs-execution-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
    }],
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.ecs_execution_role.name
}
