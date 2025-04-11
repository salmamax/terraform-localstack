# Dentro de modules/mi-recurso/outputs.tf
output "bucket_id" {
  description = "El nombre (ID) del bucket S3 creado."
  value       = aws_s3_bucket.this.id # Referencia al recurso en main.tf del módulo
}

output "bucket_arn" {
  description = "El ARN (Amazon Resource Name) del bucket S3 creado."
  value       = aws_s3_bucket.this.arn # Referencia al recurso en main.tf del módulo
}
