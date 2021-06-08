resource "aws_db_subnet_group" "rds_subnet" {
  name       = "rds_subnet"
  subnet_ids = aws_subnet.subnet-desafio02.*.id

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "desafio02" {
  depends_on             = [aws_db_subnet_group.rds_subnet]
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.small"
  identifier             = "mydbwordpress"
  db_subnet_group_name   = "rds_subnet"
  vpc_security_group_ids = [aws_security_group.sg_desafio02.id]
  name                   = "dbwordpress0305"
  username               = "dbadmin"
  password               = var.db_pass
  port                   = 3306
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
}
