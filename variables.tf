variable "subscription_id" {
  description = "ID de la suscripción Azure for Students (se define en terraform.tfvars)"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Etiquetas del proyecto"
  type        = map(string)

  default = {
    cost_center = "utvt"
    environment = "dev"
    managed_by  = "terraform"
    owner       = "resto_hub"
  }
}
