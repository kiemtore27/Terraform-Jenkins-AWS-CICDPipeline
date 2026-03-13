# Create Database Subnet Group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = var.db_subnet_group_name
  subnet_ids  = [
    aws_subnet.private_data_subnet_az1.id,
    aws_subnet.private_data_subnet_az2.id
  ]
  description = "Subnets for database instance"

  tags = {
    Name = var.db_subnet_group_name
  }
}

# Get the latest DB snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.database_snapshot_identifier
  most_recent            = true
  snapshot_type          = "manual"
}

# Create Database Instance restored from DB snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.database_instance_class
  skip_final_snapshot    = true
  availability_zone      = var.database_availability_zone
  identifier             = var.database_instance_identifier
  snapshot_identifier    = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = var.multi_az_deployment
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
}
