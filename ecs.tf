### ECS SETUP ###
resource "aws_ecs_cluster" "aws_ecs_cluster" {
  name = var.aws_ecs_cluster_name
  
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }
  
  setting {
    name = "containerInsights"
    value = "enabled"
   }
  tags = {
    Name = var.aws_ecs_cluster_tag
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_provider" {
  cluster_name       = aws_ecs_cluster.aws_ecs_cluster.name
  capacity_providers = var.ecs_cluster_capacity_provider_capacity_providers
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.ecs_task_definition_family
  network_mode             = var.ecs_task_definition_network_mode
  requires_compatibilities = var.ecs_task_definition_requires_compatibilities
  cpu                      = var.ecs_task_definition_cpu
  memory                   = var.ecs_task_definition_memory
  container_definitions = jsonencode([
    {
      name      = var.ecs_task_definition_container_definitions_name
      image     = "${aws_ecr_repository.aws_ecr_repo.repository_url}:latest"
      essential = var.ecs_task_definition_container_definitions_essential

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group      = aws_cloudwatch_log_group.app_logs.name
          awslogs-region    = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }

      environment = [
        { name = "DB_HOST", value = aws_db_instance.postgres.address },
        { name = "DB_NAME", value = "mydatabase"},
        { name = "DB_USER", value = "dbadmin" },
        { name = "DB_PASSWORD", value = "myadminpassword" }
      ]

      portMappings = [
        {
          containerPort = var.ecs_task_definition_container_definitions_portMappings_containerPort
          hostPort      = var.ecs_task_definition_container_definitions_portMappings_hostPort
          protocol      = var.ecs_task_definition_container_definitions_portMappings_protocol
        }
      ]
    }
  ])
  runtime_platform {
    operating_system_family = var.ecs_task_definition_container_definitions_runtime_platform_operating_system_family
    cpu_architecture        = var.ecs_task_definition_container_definitions_runtime_platform_operating_cpu_architecture
  }
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn = aws_iam_role.ecs_task_role.arn
  
  tags = {
    Name = var.ecs_task_definition_tag
  }
}


resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.aws_ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = var.ecs_service_launch_type


  network_configuration {
    subnets = [
      aws_subnet.demo-private-subnet-1.id,
      aws_subnet.demo-private-subnet-2.id
    ]
    assign_public_ip = var.ecs_service_network_configuration_assign_public_ip
    security_groups  = ["${aws_security_group.ecs_security_group.id}"]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn
    container_name   = var.ecs_service_network_load_balancer_container_name
    container_port   = var.ecs_service_network_load_balancer_container_port
  }
  tags = {
    Name = var.ecs_service_tag
  }
}