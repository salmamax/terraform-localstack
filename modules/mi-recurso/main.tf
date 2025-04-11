# Dentro de modules/mi-recurso/main.tf
resource "aws_s3_bucket" "this" {
  # Usamos las variables definidas en variables.tf
  bucket = var.nombre_del_bucket

  # Podemos usar otras variables o valores fijos aquí
  force_destroy = var.force_destroy

  # Ejemplo de etiqueta fija dentro del módulo (podríamos hacerla variable)
  tags = {
    ManagedBy = "Terraform Module mi-recurso"
  }
}
