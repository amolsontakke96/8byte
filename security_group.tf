### SECURITY GROUPS ###

resource "aws_security_group" "ecs_security_group" {
  name        = var.ecs_security_group_name
  description = var.ecs_security_group_description
  vpc_id      = aws_vpc.main_vpc.id
  tags = {
    Name = var.ecs_security_group_tag
  }
  ingress {
    from_port       = var.ecs_security_group_ingress_from_port
    to_port         = var.ecs_security_group_ingress_to_port
    protocol        = var.ecs_security_group_ingress_protocol
    security_groups = [aws_security_group.alb_secutity_group.id]

  }

  egress {
    from_port   = var.ecs_security_group_egress_from_port
    to_port     = var.ecs_security_group_egress_to_port
    protocol    = var.ecs_security_group_egress_protocol
    cidr_blocks = var.ecs_security_group_egress_cidr_blocks

  }
}

resource "aws_security_group" "alb_secutity_group" {
  name        = var.alb_secutity_group_name
  description = var.alb_secutity_group_description
  vpc_id      = aws_vpc.main_vpc.id
  tags = {
    Name = var.alb_secutity_group_tag
  }
  ingress {
    from_port   = var.alb_secutity_group_ingress_from_port
    to_port     = var.alb_secutity_group_ingress_to_port
    protocol    = var.alb_secutity_group_ingress_protocol
    cidr_blocks = var.alb_secutity_group_ingress_cidr_blocks
  }
  egress {
    from_port   = var.alb_secutity_group_egress_from_port
    to_port     = var.alb_secutity_group_egress_to_port
    protocol    = var.alb_secutity_group_egress_protocol
    cidr_blocks = var.alb_secutity_group_egress_cidr_blocks
  }
}

resource "aws_security_group" "rds_security_group" {
  name        = "rds-sg"
  description = "rds sg for postgres"
  vpc_id      = aws_vpc.main_vpc.id
  tags = {
    Name = "rds_security_group_tag"
  }
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_security_group.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}