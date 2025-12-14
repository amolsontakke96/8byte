
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.demo-private-subnet-1.id, aws_subnet.demo-private-subnet-2.id]

  tags = {
    Name = "rds_subnet_group_tag"
  }
  
}

resource "aws_db_instance" "postgres" {
    identifier = "postgres-db"
    engine             = "postgres"
    instance_class = "db.t3.micro"
    engine_version     = "15.13"
    username    = "dbadmin"
    password    = "myadminpassword"
    db_name      = "mydatabase"

    storage_type =  "gp2"
    allocated_storage = "20"

    skip_final_snapshot = true

    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids = [aws_security_group.rds_security_group.id]

    publicly_accessible = false

    tags = {
      Name = "rds_cluster_tag"
    }
}