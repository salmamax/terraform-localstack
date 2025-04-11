variable "nombre_del_bucket" {
  description = "El nombre único deseado para el bucket S3."
  type        = string
  # No ponemos default para que sea obligatorio pasarlo al usar el módulo
}

variable "force_destroy" {
  description = "Controla si el bucket puede ser destruido aunque contenga objetos."
  type        = bool
  default     = false # Por defecto, no forzamos la destrucción
}

# Podríamos añadir más variables aquí (ej: tags, acl, etc.)
