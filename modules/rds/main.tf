resource "aws_db_instance" "database" {
  instance_class         = "db.t2.micro"
  engine                 = "mysql" # Or any desired engine
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  multi_az               = true # for high availability
  # Add more configuration as needed
}