resource "aws_s3_bucket" "alb_logs" {
  bucket = "alb-access-logs-12341548515185"
  force_destroy = true 
}

resource "aws_s3_bucket_ownership_controls" "alb_logs_ownership" {
  bucket = aws_s3_bucket.alb_logs.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "alb_logs_acl" {
  bucket = aws_s3_bucket.alb_logs.id
  acl    = "private"

  depends_on = [
    aws_s3_bucket_ownership_controls.alb_logs_ownership
  ]
}

resource "aws_s3_bucket_policy" "alb_logs_policy" {
  bucket = aws_s3_bucket.alb_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ALBAccessLogsPolicy"
        Effect = "Allow"
        Principal = {
          Service = [
            "elasticloadbalancing.amazonaws.com",
            "logdelivery.elasticloadbalancing.amazonaws.com"
          ]
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.alb_logs.arn}/AWSLogs/156331626410/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}





resource "aws_lb" "demo_aws_lb" {
  name               = var.demo_aws_lb_name
  internal           = var.demo_aws_lb_internal
  load_balancer_type = var.demo_aws_lb_load_balancer_type
  security_groups    = [aws_security_group.alb_secutity_group.id]
  subnets = [
    aws_subnet.demo-public-subnet-1.id,
    aws_subnet.demo-public-subnet-2.id
  ]

  access_logs {
    bucket = aws_s3_bucket.alb_logs.bucket
    enabled = false
  }

  tags = {
    Name = var.demo_aws_lb_tag
  }
}

resource "aws_lb_target_group" "aws_lb_target_group" {
  name        = var.aws_lb_target_group_name
  port        = var.aws_lb_target_group_port
  protocol    = var.aws_lb_target_group_protocol
  vpc_id      = aws_vpc.main_vpc.id
  target_type = var.aws_lb_target_group_target_type

  health_check {
    path                = var.aws_lb_target_group_health_check_path
    port                = var.aws_lb_target_group_health_check_port
    protocol            = var.aws_lb_target_group_health_check_protocol
    interval            = var.aws_lb_target_group_health_check_interval
    timeout             = var.aws_lb_target_group_health_check_timeout
    healthy_threshold   = var.aws_lb_target_group_health_check_healthy_threshold
    unhealthy_threshold = var.aws_lb_target_group_health_check_unhealthy_threshold
    matcher             = var.aws_lb_target_group_health_check_matcher
  }
}

resource "aws_lb_listener" "aws_lb_listener" {
  load_balancer_arn = aws_lb.demo_aws_lb.arn
  port              = var.aws_lb_listener_port
  protocol          = var.aws_lb_listener_protocol

  default_action {
    type             = var.aws_lb_listener_default_action_type
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn
  }

}

resource "aws_lb_listener_rule" "aws_lb_listener_rule" {
  listener_arn = aws_lb_listener.aws_lb_listener.arn
  priority     = var.aws_lb_listener_rule_priority
  action {
    type             = var.aws_lb_listener_rule_action_type
    target_group_arn = aws_lb_target_group.aws_lb_target_group.arn
  }
  condition {
    path_pattern {
      values = var.aws_lb_listener_rule_condition_path_pattern_values
    }
  }
}

