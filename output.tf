# IP PUBLICA
output "instance_public_ip" {
  description = "Direccion de la IP publica de la instancia"
  value       = aws_instance.EC2.public_ip
}
# DNS
output "dns" {
  description = "dns para conectarme por ssh"
  value       = aws_instance.EC2.public_dns
}

