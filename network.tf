module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # ¿De donde obtenemos el modulo? de la pagina de terraform
  version = "3.18.1" #version del modulo

  name = var.vpc_name #nombre de la vpc tomado de las variables
  cidr = var.vpc_cidr #nombre del block de ips tomado de las variables tambien

  azs             = var.vpc_azs #las zonas de disponibilidad 
  private_subnets = var.vpc_private_subnets #subnets privadas
  public_subnets  = var.vpc_public_subnets #subnets publicas

  enable_nat_gateway = var.vpc_enable_nat_gateway #el nat gateway, que lo quiero dejar desactivado

  tags = var.vpc_tags #los tags
}