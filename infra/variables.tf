variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "db_name" {
  description = "Database name"
  default     = "mydatabase"
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

# Variable para el ID de la clave KMS
variable "kms_key_id" {
  description = "KMS key ID for database encryption"
  type        = string
}
