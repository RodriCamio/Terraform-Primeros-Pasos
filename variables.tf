variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Instancia"
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
  default     = "Ejemplo_de_vpc"
}

variable "vpc_cidr" {
  description = "CIDR block para VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones de la VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "Las subnets privadas para la VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "las subnets publicas para la VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "NAT gateway, que lo tengo desctivado para evitar salirme de lo gratuito"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "Tags para aplicar a los recursos creados por el modulo VPC"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}