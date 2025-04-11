terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Actualizada de la 4 a la 5
    }
  }
}

# Configuración del proveedor AWS para LocalStack (¡IMPORTANTE MANTENER!)
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

# COMENTAMOS O BORRAMOS EL RECURSO S3 ORIGINAL:
# resource "aws_s3_bucket" "mi_bucket_local" { # O "mi_primer_bucket", etc.
#   bucket = "mi-bucket-localstack-${formatdate("YYYYMMDD", timestamp())}"
#   force_destroy = true
# }

# Mantenemos la instancia EC2
resource "aws_instance" "mi_instancia_local" {
  ami           = "ami-12345678"
  instance_type = "t2.small" # La dejamos como quedó en la Tarea 3

  tags = {
    Name = "MiInstanciaTerraformLocal" // <-- Volver al valor anterior
  }
}

# NUEVO: Usamos nuestro módulo para crear el bucket S3
module "mi_bucket_s3" {
  source = "./modules/mi-recurso" # Ruta relativa al directorio del módulo

  # Pasamos los valores para las variables definidas en el módulo
  nombre_del_bucket = "mi-bucket-modulo-${formatdate("YYYYMMDD", timestamp())}"
  force_destroy     = true # Sobreescribimos el default del módulo
}

# COMENTAMOS O BORRAMOS EL OUTPUT ORIGINAL DEL BUCKET:
# output "nombre_bucket" {
#   value = aws_s3_bucket.mi_bucket_local.bucket
# }

# Mantenemos el output de la instancia
output "id_instancia" {
  value = aws_instance.mi_instancia_local.id
}

# NUEVO: Output que usa la salida del módulo
output "nombre_bucket_desde_modulo" {
  description = "Nombre del bucket S3 creado por el módulo."
  # Accedemos a la salida "bucket_id" definida en outputs.tf del módulo
  value = module.mi_bucket_s3.bucket_id
}

output "arn_bucket_desde_modulo" {
   description = "ARN del bucket S3 creado por el módulo."
   # Accedemos a la salida "bucket_arn" definida en outputs.tf del módulo
   value = module.mi_bucket_s3.bucket_arn
 }
# Comentario de prueba

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
# Nueva configuración de backend
