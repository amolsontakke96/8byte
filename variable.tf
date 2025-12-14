## VPC SETUP VARIABLES ##

variable "cidr_block" {
    description = "Value for Cidr Block"
    type        = string
    default = "10.0.0.0/16"
}

variable "vpc_tag" {
    description = "Tag for VPC"
    type        = string
    default = "demo-vpc"
}

variable "vpc_public_subnet_1_cidr" {
    description = "CIDR Block for Public Subnet 1"
    type        = string
    default = "10.0.1.0/24"
}

variable "vpc_public_subnet_1a_availability_zone" {
    description = "Availability Zone for Public Subnet 1a"
    type        = string
    default = "us-east-1a"
  
}

variable "vpc_public_subnet_1_tag" {
    description = "Tag for Public Subnet 1"
    type        = string
    default = "demo-public-subnet-1"
}

variable "vpc_public_subnet_2_cidr" {
    description = "CIDR Block for Public Subnet 2"
    type        = string
    default = "10.0.2.0/24"
}

variable "vpc_public_subnet_2b_availability_zone" {
    description = "Availability Zone for Public Subnet 2b"
    type        = string
    default = "us-east-1b"
  
}

variable "vpc_public_subnet_2_tag" {
    description = "Tag for Public Subnet 2"
    type        = string
    default = "demo-public-subnet-2"
}


variable "vpc_private_subnet_1_cidr" {
    description = "CIDR Block for Private Subnet 1"
    type        = string
    default = "10.0.3.0/24"
}

variable "vpc_private_subnet_1a_availability_zone" {
    description = "Availability Zone for Public Subnet 1a"
    type        = string
    default = "us-east-1a"
  
}

variable "vpc_private_subnet_1_tag" {
    description = "Tag for Private Subnet 2"
    type        = string
    default = "demo-private-subnet-1"
}

variable "vpc_private_subnet_2_cidr" {
    description = "CIDR Block for Private Subnet 2"
    type        = string
    default = "10.0.4.0/24"
}

variable "vpc_private_subnet_2b_availability_zone" {
    description = "Availability Zone for Public Subnet 2b"
    type        = string
    default = "us-east-1b"
  
}

variable "vpc_private_subnet_2_tag" {
    description = "Tag for Private Subnet 2"
    type        = string
    default = "demo-private-subnet-2"
}

variable "main_igw_tag" {  
    description = "Tag for Internet Gateway"
    type        = string
    default = "demo-igw"
}

variable "nat_eip_domain" {
    description = "Domain for NAT EIP"
    type        = string
    default = "vpc"
}

variable "nat_eip_tag" {
    description = "Tag for NAT EIP"
    type        = string
    default = "demo-nat-eip"
}

variable "main_nat_gw_tag" {
    description = "Tag for NAT Gateway"
    type        = string
    default = "demo-nat-gw"  
}

variable "public_rt_tag" {
    description = "Tag for Public Route Table"
    type        = string
    default = "demo-public-rt"
}

variable "private_rt_tag" {
    description = "Tag for Private Route Table"
    type        = string
    default = "demo-private-rt"
}

variable "public_rt_route_destination_cidr" {
    description = "CIDR Block for Public Route Table Route"
    type        = string
    default = "0.0.0.0/0"
  
}

variable "private_rt_route_destination_cidr" {
    description = "CIDR Block for Private Route Table Route"
    type        = string
    default = "0.0.0.0/0"
}

variable "ecs_security_group_name" {
    description = "Tag for ECS Security Group"
    type        = string
    default = "demo-ecs-sg"
}

variable "ecs_security_group_description" {
    description = "Description for ECS Security Group"
    type        = string
    default = "Security group for ECS tasks"
  
}

variable "ecs_security_group_tag" {
    description = "Tag for ECS Security Group"
    type        = string
    default = "demo-ecs-sg"
  
}

variable "ecs_security_group_ingress_from_port" {
    description = "Ingress From Port for ECS Security Group"
    type        = string
    default = "5000"
  
}

variable "ecs_security_group_ingress_to_port" {
    description = "Ingress To Port for ECS Security Group"
    type        = string
    default = "5000"
}

variable "ecs_security_group_ingress_protocol" {
    description = "Ingress Protocol for ECS Security Group"
    type        = string
    default = "tcp"
  
}
variable "ecs_security_group_egress_from_port" {
    description = "Egress From Port for ECS Security Group"
    type        = string
    default = "0"
  
}

variable "ecs_security_group_egress_to_port" {
    description = "Egress To Port for ECS Security Group"
    type        = string
    default = "0"
  
}

variable "ecs_security_group_egress_protocol" {
    description = "Egress Protocol for ECS Security Group"
    type        = string
    default = "-1"
  
}

variable "ecs_security_group_egress_cidr_blocks" {
    description = "Egress CIDR Blocks for ECS Security Group"
    type        = list(string)
    default = ["0.0.0.0/0"]
  
}

variable "alb_secutity_group_name" {
    description = "Tag for ALB Security Group"
    type        = string
    default = "demo-alb-sg"
  
}

variable "alb_secutity_group_description" {
    description = "Description for ALB Security Group"
    type        = string
    default = "Security group for ALB"
  
}

variable "alb_secutity_group_tag" {
    description = "Tag for ALB Security Group"
    type        = string
    default = "demo-alb-sg"
  
}

variable "alb_secutity_group_ingress_from_port" {
    description = "Ingress From Port for ALB Security Group"
    type        = string
    default = "80"
  
}

variable "alb_secutity_group_ingress_to_port" {
    description = "Ingress To Port for ALB Security Group"
    type        = string
    default = "80"
  
}

variable "alb_secutity_group_ingress_protocol" {
    description = "Ingress Protocol for ALB Security Group"
    type        = string
    default = "tcp"
  
}

variable "alb_secutity_group_ingress_cidr_blocks" {
    description = "Ingress CIDR Blocks for ALB Security Group"
    type        = list(string)
    default = ["0.0.0.0/0"]
  
}

variable "alb_secutity_group_egress_from_port" {
    description = "Egress From Port for ALB Security Group"
    type        = string
    default = "0"
  
}

variable "alb_secutity_group_egress_to_port" {
    description = "Egress To Port for ALB Security Group"
    type        = string
    default = "0"
  
}

variable "alb_secutity_group_egress_protocol" {
    description = "Egress Protocol for ALB Security Group"
    type        = string
    default = "-1"
  
}

variable "alb_secutity_group_egress_cidr_blocks" {
    description = "Egress CIDR Blocks for ALB Security Group"
    type        = list(string)
    default = ["0.0.0.0/0"]
  
}

variable "ecs_task_execution_policy_name" {
    description = "Name for ECS Task Execution Policy"
    type        = string
    default = "demo-ecs-task-execution-policy"
  
}

variable "ecs_task_execution_role_name" {
    description = "Name for ECS Task Execution Role"
    type        = string
    default = "demo-ecs-task-execution-role"
  
}

variable "ecs_task_execution_tag" {
    description = "Tag for ECS Task Execution Role"
    type        = string
    default = "demo-ecs-task-execution-role"
  
}

variable "demo_aws_lb_name" {
    description = "Name for Demo Application Load Balancer"
    type        = string
    default = "demo-application-lb"
  
}

variable "demo_aws_lb_internal" {
    description = "Internal for Demo Application Load Balancer"
    type        = bool
    default = false
  
}

variable "demo_aws_lb_load_balancer_type" {
    description = "Load Balancer Type for Demo Application Load Balancer"
    type        = string
    default = "application"
  
}

variable "demo_aws_lb_tag" {
    description = "Tag for Demo Application Load Balancer"
    type        = string
    default = "demo-application-lb"
  
}

variable "aws_lb_target_group_name" {
    description = "Name for AWS LB Target Group"
    type        = string
    default = "demo-target-group"
  
}

variable "aws_lb_target_group_port" {
    description = "Port for AWS LB Target Group"
    type        = string
    default = "5000"
  
}

variable "aws_lb_target_group_protocol" {
    description = "Protocol for AWS LB Target Group"
    type        = string
    default = "HTTP"
  
}

variable "aws_lb_target_group_target_type" {
    description = "Target Type for AWS LB Target Group"
    type        = string
    default = "ip"
  
}

variable "aws_lb_target_group_health_check_path" {
    description = "Health Check Path for AWS LB Target Group"
    type        = string
    default = "/"
  
}

variable "aws_lb_target_group_health_check_port" {
    description = "Health Check Port for AWS LB Target Group"
    type        = string
    default = "5000"
  
}

variable "aws_lb_target_group_health_check_protocol" {
    description = "Health Check Protocol for AWS LB Target Group"
    type        = string
    default = "HTTP"
  
}

variable "aws_lb_target_group_health_check_interval" {
    description = "Health Check Interval for AWS LB Target Group"
    type        = string
    default = "30"
  
}

variable "aws_lb_target_group_health_check_timeout" {
    description = "Health Check Timeout for AWS LB Target Group"
    type        = string
    default = "5"
  
}

variable "aws_lb_target_group_health_check_healthy_threshold" {
    description = "Health Check Healthy Threshold for AWS LB Target Group"
    type        = string
    default = "2"
  
}

variable "aws_lb_target_group_health_check_unhealthy_threshold" {
    description = "Health Check Unhealthy Threshold for AWS LB Target Group"
    type        = string
    default = "2"
  
}

variable "aws_lb_target_group_health_check_matcher" {
    description = "Health Check Matcher for AWS LB Target Group"
    type        = string
    default = "200-399"
  
}

variable "aws_lb_listener_port" {
    description = "Port for AWS LB Listener"
    type        = string
    default = "80"
  
}

variable "aws_lb_listener_protocol" {
    description = "Protocol for AWS LB Listener"
    type        = string
    default = "HTTP"
  
}

variable "aws_lb_listener_default_action_type" {
    description = "Default Action Type for AWS LB Listener"
    type        = string
    default = "forward"
  
}

variable "aws_lb_listener_rule_priority" {
    description = "Priority for AWS LB Listener Rule"
    type        = number
    default = 1
  
}

variable "aws_lb_listener_rule_action_type" {
    description = "Action Type for AWS LB Listener Rule"
    type        = string
    default = "forward"
  
}

variable "aws_lb_listener_rule_condition_path_pattern_values" {
    description = "Condition Path Pattern Values for AWS LB Listener Rule"
    type        = list(string)
    default = ["/"]
  
}


variable "aws_ecr_repo_name" {
    description = "Name for AWS ECR Repository"
    type        = string
    default = "demo-2049"
  
}

variable "aws_ecr_repo_image_tag_mutability" {
    description = "Image Tag Mutability for AWS ECR Repository"
    type        = string
    default = "MUTABLE"
  
}

variable "aws_ecr_repo_force_delete" {
    description = "Force Delete for AWS ECR Repository"
    type        = bool
    default = true
  
}

variable "aws_ecr_repo_tag" {
    description = "Tag for AWS ECR Repository"
    type        = string
    default = "demo-ecr-repo"
  
}

variable "aws_ecs_cluster_name" {
    description = "Name for AWS ECS Cluster"
    type        = string
    default = "demo-ecs-cluster"
  
}

variable "aws_ecs_cluster_tag" {
    description = "Tag for AWS ECS Cluster"
    type        = string
    default = "demo-ecs-cluster"
  
}

variable "ecs_cluster_capacity_provider_capacity_providers" {
    description = "Capacity Providers for ECS Cluster Capacity Providers"
    type        = list(string)
    default = ["FARGATE"]
  
}

variable "ecs_task_definition_family" {
    description = "Family for ECS Task Definition"
    type        = string
    default = "demo-task-def"
  
}

variable "ecs_task_definition_network_mode" {
    description = "Network Mode for ECS Task Definition"
    type        = string
    default = "awsvpc"
  
}

variable "ecs_task_definition_requires_compatibilities" {
    description = "Requires Compatibilities for ECS Task Definition"
    type        = list(string)
    default = ["FARGATE"]
  
}

variable "ecs_task_definition_cpu" {
    description = "CPU for ECS Task Definition"
    type        = string
    default = "256"
  
}

variable "ecs_task_definition_memory" {
    description = "Memory for ECS Task Definition"
    type        = string
    default = "512"
  
}

variable "ecs_task_definition_container_definitions_name" {
    description = "Container Definitions Name for ECS Task Definition"
    type        = string
    default = "demo-container"
  
}

variable "ecs_task_definition_container_definitions_portMappings_containerPort" {
    description = "Container Port for ECS Task Definition Container Definitions Port Mappings"
    type        = number
    default = 5000
  
}

variable "ecs_task_definition_container_definitions_portMappings_hostPort" {
    description = "Host Port for ECS Task Definition Container Definitions Port Mappings"
    type        = number
    default = 5000
  
}

variable "ecs_task_definition_container_definitions_portMappings_protocol" {
    description = "Protocol for ECS Task Definition Container Definitions Port Mappings"
    type        = string
    default = "tcp"
  
}

variable "ecs_task_definition_container_definitions_runtime_platform_operating_system_family" {
    description = "Operating System Family for ECS Task Definition Runtime Platform"
    type        = string
    default = "LINUX"
  
}

variable "ecs_task_definition_container_definitions_runtime_platform_operating_cpu_architecture" {
    description = "CPU Architecture for ECS Task Definition Runtime Platform"
    type        = string
    default = "X86_64"
  
}

variable "ecs_task_definition_tag" {
    description = "Tag for ECS Task Definition"
    type        = string
    default = "demo-ecs-task-definition"
  
}

variable "ecs_task_definition_container_definitions_essential" {
    description = "Essential for ECS Task Definition Container Definitions"
    type        = bool
    default = true
  
}


variable "ecs_service_name" {
    description = "Name for ECS Service"
    type        = string
    default = "demo-ecs-service"
  
}

variable "ecs_service_desired_count" {
    description = "Desired Count for ECS Service"
    type        = number
    default = 1
  
}

variable "ecs_service_launch_type" {
    description = "Launch Type for ECS Service"
    type        = string
    default = "FARGATE"
  
}

variable "ecs_service_network_configuration_assign_public_ip" {
    description = "Assign Public IP for ECS Service Network Configuration"
    type        = bool
    default = false
  
}

variable "ecs_service_network_load_balancer_container_name" {
    description = "Container Name for ECS Service Network Load Balancer"
    type        = string
    default = "demo-container"
  
}

variable "ecs_service_network_load_balancer_container_port" {
    description = "Container Port for ECS Service Network Load Balancer"
    type        = number
    default = 5000
  
}

variable "ecs_service_tag" {
    description = "Tag for ECS Service"
    type        = string
    default = "demo-ecs-service"
  
}

variable "docker_image_name" {
    description = "Name for Docker Image"
    type        = string
    default = "2048-container"
  
}

variable "aws_region" {
    description = "AWS Region"
    type        = string
    default = "us-east-1"
  
}