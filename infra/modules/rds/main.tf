resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.4"
  instance_class       = "db.t2.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true

  # Encriptación en reposo
  storage_encrypted = true
  kms_key_id        = var.kms_key_id

  # Habilitar exportación de logs
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]  
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
