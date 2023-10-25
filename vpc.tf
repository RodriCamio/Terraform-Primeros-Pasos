# Comente la vpc para no tener conflictos con la ip publica. Es un tema a resolver.

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = var.vpc_name
#   cidr = var.cidr_vpc

#   azs             = var.azs
#   private_subnets = var.private_subnets
#   public_subnets  = var.public_subnets

#   enable_nat_gateway = var.enable_nat_gateway
#   enable_vpn_gateway = var.enable_vpn_gateway

#   tags = local.tags
# }