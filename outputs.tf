output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.web.public_ip
# }

output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instances"
  value       = module.ec2_instances[*].public_ip
}