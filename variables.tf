variable "ami" {
    type = string
    description = "Imagen para la instancia EC2"
}

variable "instance_type" {
    type = string
    description = "Que tipo de instancia vamos a trabajar, es opcional ya que con el ami tambien tenemos este dato."
}

variable "region" {
    type = string
    description = "region donde vamos a crear nuestros recursos."
}

variable "environment" {
    type = string
    description = "En que entorno estoy trabajando"
}

variable "proyect" {
    type = string
    description = "Nombre del proyecto" 
}

variable "team" {
    type = string
    description = "Equipo de trabajo"
}

variable "vpc_name" {
    type = string
    description = "Nombre de nuestra vpc"  
}

variable "cidr_vpc" {
    type = string 
    description = "que rango vamos a manejar con la vpc"
    default = "10.0.0.0/16"
}

variable "azs" {
    description = "Zonas de disponibilidad, el tipo es opcional porque puede ser solo string o una lista de strings"  
}

variable "private_subnets" {
    description = "IP privada, nuevamente puede ser una sola string o una lista de subnets"  
}

variable "public_subnets" {
    description = "IP publica, nuevamente puede ser una sola string o una lista de subnets"  
}

variable "enable_nat_gateway" {
    type = bool
    default = false
    description = "Este recurso lo dejo en false por defecto para evitar gastos por aws cobra por este servicio."  
}

variable "enable_vpn_gateway" {
    type = bool
    default = false
    description = "Este recurso lo dejo en false por defecto para evitar gastos por aws cobra por este servicio."
}

variable "name_sg" {
    type =  string
    description = "Nombre del security group"
}

variable "access_key" {
    type = string
    sensitive = true
    description = "llave publica, con el atributo 'sensitive' para que no se muestre en ningun lado su valor."  
}

variable "secret_key" {
    type = string
    sensitive = true
    description = "llave privada, con el atributo 'sensitive' para que no se muestre en ningun lado su valor."  
}

locals {
  environment = var.environment
  proyect = var.proyect
  team = var.team

  tags = {
    environment = local.environment
    proyect = local.proyect
    team = local.team
  }
}