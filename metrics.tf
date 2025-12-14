resource "aws_cloudwatch_log_group" "app_logs" {
    name             = "/ecs/${var.aws_ecs_cluster_name}"
    retention_in_days = 14
  
}

resource "aws_cloudwatch_dashboard" "ecs_dashboard" {
    dashboard_name = "Infrastructure_and_ecs_health_Dashboard"
    dashboard_body = jsonencode({
        widgets = [
            {
                type = "metric"
                x = 0
                y = 0
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "AWS/ECS", "CPUUtilization", "ServiceName", "demo-ecs-service", "ClusterName", "demo-ecs-cluster"]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "ECS Cluster CPU Utilization"
                }
            },
            {
                type = "metric"
                x = 0
                y = 7
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "AWS/ECS", "MemoryUtilization", "ServiceName", "demo-ecs-service", "ClusterName", "demo-ecs-cluster"]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "ECS Cluster Memory Utilization"
                }
            },
            {
                type = "metric"
                x = 0
                y = 7
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "ECS/ContainerInsights", "DesiredTaskCount", "ServiceName", "demo-ecs-service", "ClusterName", "demo-ecs-cluster"],
                        [ ".", "RunningTaskCount", ".", ".", ".", "." ]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "ECS Running Vs Desired Tasks"
                }
            }
        ]
    })
}

resource "aws_cloudwatch_dashboard" "application_and_rds_dashboard" {
    dashboard_name = "Application_and_Database_Dashboard"
    dashboard_body = jsonencode({
        widgets = [
            {
                type = "metric"
                x = 0
                y = 0
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [  "AWS/ApplicationELB", "RequestCount", "LoadBalancer", "app/demo-application-lb/a452c2430028186b" ]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "Application Load Balancer Request Count"
                }
            },
            {
                type = "metric"
                x = 0
                y = 7
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", "app/demo-application-lb/a452c2430028186b"]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "Application Load Balancer Response Time"
                }
            },
            {
                type = "metric"
                x = 0
                y = 7
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", "postgres-db", { "period": 60 }]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "RDS PostgreSQL CPU Utilization"
                }
            },
            {
                type = "metric"
                x = 0
                y = 7
                width = 24
                height = 6
                properties = {
                    metrics = [
                        [ "AWS/RDS", "DatabaseConnections", "DBInstanceIdentifier", "postgres-db", { "period": 60 } ]
                    ]
                    period = 300
                    stat = "Average"
                    region = "us-east-1"
                    title = "RDS PostgreSQL database Connections"
                }
            }
        ]
    })
}