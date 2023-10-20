output "vpc_public_subnets" {
  description = "IDs de las subnets publicas de la VPC"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "IP publicas de las instancias EC2"
  value       = module.ec2_instances[*].public_ip
}